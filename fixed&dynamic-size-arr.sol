pragma solidity ^0.8.0;

contract array{


// fixed size array 
// uint[4] public arr = [4,8,1,6];

// function set(uint index, uint value) public{
//     arr[index] = value;
// }
// function len() public view returns(uint){
//     return arr.length;
// }

// dynamic size array
uint [] public arr;

function pushElement(uint value) public {
    arr.push(value);
}
function popElement() public{
    arr.pop();
}

function len() public view returns(uint){
    return arr.length;
}

}
