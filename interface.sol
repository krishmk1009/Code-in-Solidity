// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface B {
    function get() external  pure returns(uint);
} 

contract a is B {
    function get() external  pure override  returns(uint){
        return 2;
    }
}
