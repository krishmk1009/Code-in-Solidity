pragma solidity ^0.8.0;

contract practice{

    //mapping with simple data type
    /*
    mapping(uint=>string) public roll_no;

    function setter(uint _roll , string memory _name) public{
        roll_no[_roll] = _name;

    }
    */

    // mapping with stucture;

    struct Student{
        string name;
        uint class;
    }

    mapping(uint=>Student) public data;

    function set(uint _roll , string memory _name ,uint _class ) public{
        data[_roll] = Student(_name,_class);
    }
}
