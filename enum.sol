// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract en{


enum  state {waiting, inProgress , completed}

state public Gamestatus;

function setState() public  {
    Gamestatus = state.completed;
}
    

   
}
