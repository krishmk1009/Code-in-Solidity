// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract transferAm {
   mapping(address=>uint) public balances;
   uint public totalSupply;

   constructor(uint _totalSupply){
       balances[msg.sender] = _totalSupply;
        totalSupply = _totalSupply;
   }

   function sendEther(address _to , uint _amount) public {
       require(_amount>0 , "Amount should be greater than zero");
       require(balances[msg.sender]>=_amount , "not enough amount to send");

       balances[msg.sender] -= _amount;
       balances[_to] += _amount;
   }
}
