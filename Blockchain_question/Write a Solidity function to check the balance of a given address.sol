// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract chBalance {

    function checkBalance(address _addr) public view returns (uint){
        return _addr.balance;
    }
    
}
