// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract randomNum {

    function genRan() public view returns (uint){
        
        uint num = uint(keccak256(abi.encodePacked(block.timestamp ,msg.sender)))%100;
        return num;
    }
}
