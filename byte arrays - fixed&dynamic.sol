pragma solidity ^0.8.0;

contract demo{
// fixed size byte array
    // bytes7 public b;

    // function set() public{
    //     b = 'krushna';
    // }
    

// dynamic size byte array

bytes public b ="ab";

function pushValue() public{
    b.push('d');
}
function acess(uint i) public view returns(bytes1){
return b[i];
}
function len() public view returns(uint){
    return b.length;
}
}
