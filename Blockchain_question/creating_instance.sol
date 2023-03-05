// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract first {
    uint public val = 5;

    function getVal() public view returns(uint){
        return val;
    }
}

contract second  {

    first newVal = new first();

    function getNewVal() public view returns(uint){
        return newVal.val();
    }
}
