// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vendingMachine {

address public  owner ;
mapping  (address=> uint) public  donutBalance;

constructor() {
    owner = msg.sender;
    donutBalance[address(this)] = 100;
}

function getDonutBalance() public  view returns(uint){
    return donutBalance[address(this)];
}

function restock(uint amount) public  {
    require(msg.sender == owner , "Only owner of this machine can restock it.");
    require((donutBalance[address(this)]) + amount <=100 , "Sorry! there is not enough space to fill the machine .");
    donutBalance[address(this)] += amount ;
}

function purchaseDonut(uint amount) public  payable  {
    require(msg.value >= amount* 2 ether, "You must atleast 2 eth per donut.");
    require(donutBalance[address(this)] >= amount , "Sorry sir !! , out of stock.");
    donutBalance[address(this)] -= amount ;
    donutBalance[msg.sender] += amount;

}

}
