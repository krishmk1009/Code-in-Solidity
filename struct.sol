// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract stru{

    struct Person {
        string name;
        uint age;
    }

    Person[] public people;

    function addPeople(string memory _name , uint _age) public {
        Person memory newPerson = Person(_name , _age);
        people.push(newPerson);

        
            }
}
