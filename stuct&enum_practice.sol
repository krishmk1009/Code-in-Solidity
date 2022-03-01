pragma solidity ^0.8.0;

struct  student{
    uint roll_no;
    string name;
}

contract practice{
    student public s1;

    // constructor(uint _roll,string memory _name){
    //     s1.roll_no = _roll;
    //     s1.name = _name;
    // }

    function changeData(uint _roll , string memory _name) public{
        student memory new_student = student({
            roll_no: _roll,
            name : _name
        });
        s1 = new_student;
    }
// directly adding value from functon 
    // function changeData(uint _roll , string memory _name) public{
    //     s1 = student({
    //         roll_no: _roll,
    //         name : _name
    //     });
    // }


enum customer{allowed,not_allowed, wait}
customer public c1 = customer.allowed;
uint public lottery = 100;
function check() public {
    if(c1 == customer.allowed){
        lottery = 0;
    }
}

function change() public{
    c1 = customer.not_allowed;
    lottery = 100;
}
}
