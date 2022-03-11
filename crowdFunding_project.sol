// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;

contract funding{
    mapping (address=>uint) public contributors;  // adresss => ether
    address public manager;
    uint public target;
    uint public noofContributors;
    uint public deadline;
    uint public raisedAmount;
    uint public minimumContribution; 

    constructor(uint _target , uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        manager = msg.sender;
        minimumContribution = 100 wei;

    }
    struct Request{
        string description;
        address payable recipient ;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;
    }
    mapping(uint=>Request) public request;
    uint public numRequest;
    
    function sendEth() public payable {
        require(block.timestamp < deadline ,"deadline has passed");
        require(msg.value > minimumContribution , "minimum amount not met");

        if(contributors[msg.sender]==0){
            noofContributors++;
        }
        contributors[msg.sender]+= msg.value;
        raisedAmount += msg.value;

    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function refund() public {
        require(block.timestamp>deadline && raisedAmount< target, "you cannot withdraw the amount");
        require(contributors[msg.sender]>0);  // check whether he donated or not
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);   // this will tell the particular amount donate by that address
        contributors[msg.sender] = 0;    // the amount will get zero for that adress after refund

    }

    modifier onlyManager(){
        require(msg.sender == manager,"only manager can create request");
        _;
    }

    function createRequest(string memory _description , address payable _reciepent , uint _value) public onlyManager{  // this will create a request
        Request storage newRequest = request[numRequest];     
        newRequest.description = _description; //set the dscription of the req
        newRequest.recipient = _reciepent;    //set the reciepint address of the req
        newRequest.value = _value;          //set the amount which is required for the recipeint of the req
        newRequest.completed = false;       // we use this later for checking whether he raised the funds of not
        newRequest.noOfVoters = 0;         // no of voters 
        

    }
    function voteRequest(uint _requestNo) public{
        require(contributors[msg.sender]>0 , "you must be contribute");   //for voting you must be contriubtor
        Request storage thisRequest  = request[_requestNo];     // pointing the request which contributor wants to vote
        require(thisRequest.voters[msg.sender]==false,"you have alredy voted");   //check whether contributor alredy voted or not 
        thisRequest.voters[msg.sender] = true;   // set him as true because he voted
        thisRequest.noOfVoters++;  // increase the no of voting .

    }
    function makePayment(uint _requestNo) public onlyManager{
        require(raisedAmount>=target, "not raised enough amount"); 
        Request storage thisRequest = request[_requestNo];   // point current request
        require(thisRequest.completed == false , "the request has alredy been completed");  //check whether it is completed alredy or not
        require(thisRequest.noOfVoters > noofContributors/2 ,"majority doesnt support");  //check the vote is in favour
        thisRequest.recipient.transfer(thisRequest.value);   //trasfer the value which was requested
        thisRequest.completed=true;   //set the req as true
    }
}
