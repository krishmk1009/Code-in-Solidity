pragma solidity 0.6.0;

contract myContract{
uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
address public owner;

constructor() public {
    owner = msg.sender;
}

function isEven(uint _number) public view returns(bool){
    if(_number % 2 ==0){
        return true;
    }else{
        return false;
    }
}

function countEven() public view returns(uint){

uint count = 0;

    for(uint i = 0 ; i < numbers.length ; i++) {
        if(isEven(numbers[i])){
            count ++;
        }
    }
    return count ;
}

function isOwner() public view returns(bool){
    return(msg.sender==owner);
}

}