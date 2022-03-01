pragma solidity ^0.8.0;

contract demo{

    uint [3] public arr ;
    uint count ;

    function loop() public{
        // while(count<arr.length){
        //     arr[count] = count ;
        //     count++;
        // }

        for(uint i = 0 ; i<arr.length ; i++){
          arr[i] = i;  
        }

    }

    function condition(int a) public pure returns(string memory){
        string memory value;
        if(a>0){
            value = "a is greater than 0";
        }
        else if(a==0){
            value = "a is equal to 0";
        }
        else{
            value = "a is less than 0";
        }
        return value;
    }


    function check(uint a) public pure returns(bool){
        bool value;
        if(a>10){
            value = true;
            return value;
        }
        else{
            value = false;
            return value;
        }
    }
}
