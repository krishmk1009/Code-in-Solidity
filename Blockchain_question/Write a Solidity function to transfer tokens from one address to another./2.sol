contract transferEth{

    address public owner ; 

    constructor(){
        owner = msg.sender;
    }

   function sendEth(address payable _recipient) payable public  {
    require(owner == msg.sender, "You cannot send the ethers");
    require(msg.value > 0, "Amount must be > 0");
    

    _recipient.transfer(msg.value);
}

}
