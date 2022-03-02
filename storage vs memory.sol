pragma solidity ^0.8.0;

contract data{

    string[] public name = ["mk", "sanket","prajwal"];

    function mem() public view{
        string[] memory n1 = name;
        n1[0] = "avanti";

    } 
    function stor() public {   // cant be view bcz it is modifying the state bcz of the storage .
        string[] storage n1 = name;
        n1[0]="avanti";
    }
}
