// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;


library lib{
    function add() public pure returns(uint){
        return 5+6;
    }
}


contract demo {
    function callLibFun() public pure returns (uint){
        return lib.add();
    }
}
