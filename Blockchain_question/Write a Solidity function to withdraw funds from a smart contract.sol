// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Withdraw {
    address payable public owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    function fundContract() public payable {
        // No additional logic is required here, since the function is marked as "payable"
    }
    
    function withdrawFund(uint _amount, address payable _to) public {
        require(_amount <= address(this).balance, "Insufficient balance in the contract");
        require(msg.sender == owner, "Only the contract owner can withdraw funds");
        
        _to.transfer(_amount);
    }

    function getContractBal() public view returns (uint) {
        return address(this).balance;
    }
}
