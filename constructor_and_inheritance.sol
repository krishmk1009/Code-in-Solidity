// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract a {
    uint public  num;

    constructor(uint _num) {

        num = _num;
    }
}


contract b is a {

    constructor() a(5) {
        
    }

    function getValue() public  view  returns (uint){
        return num;
    }
}
