pragma solidity  ^0.6.0;

contract myContract{

    uint [] public myArr = [0,4,8];
    uint [][] public myArr2d = [ [1,4,6],[4,9,8] ];
    string [] public values;

    function addValue(string memory _value) public {
        values.push(_value);
    }
    function valueCount() public view returns(uint){
        return values.length;
    }
}
