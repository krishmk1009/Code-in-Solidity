// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract modi{
    address public  owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "only owner can modify this function");
        _;
    }

    function funName() public onlyOwner {
        // body of the function
    }
}
