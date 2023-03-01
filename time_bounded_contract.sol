//Write a Solidity function to implement a time-locked contract, which allows funds to be withdrawn only after a certain time has elapsed.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract timeBoundContract {

    mapping (address=>uint256) public storeTime;
    mapping (address=>uint256) public balances;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function fundContract() public  payable{
        balances[msg.sender] += msg.value;
        storeTime[msg.sender] = block.timestamp + 30;
    } 

    function withdraw(uint _amount , address _to) public {
        require(_amount < address(this).balance ,"insuffienct balance in the contract");
        require(balances[_to] >= _amount , "infufficient balance");
        require(block.timestamp >=storeTime[_to] , "you cannot withdraw funds right now" );
        payable (_to).transfer(_amount);
        balances[_to]-= _amount;
    }

    function checkBalance() public view returns (uint){
        return address(this).balance;
    }
    
}
