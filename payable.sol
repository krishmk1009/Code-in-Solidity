pragma solidity ^0.8.0;

contract pay{


address payable user = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    function payToContract() public payable{

    }
    function checkBal() public view returns(uint){
        return address(this).balance;
    }

function payToAcc() public {
    user.transfer(2 ether);
}

}
