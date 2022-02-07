pragma solidity ^0.6.0;

contract myMapping{
    mapping(uint => string) public myKeyValue;

    constructor() public{
        myKeyValue[1] = "krushna" ;
        myKeyValue[2] = "john";
    }

    mapping (uint=> Book) public books;
    mapping(uint => Games) public games;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book{
        string title;
        string author;
    }

    struct Games{
        string name;
        string player;
    }

    function addBooks(uint _id, string memory _title , string memory _author) public{
        books[_id] = Book(_title, _author);
    }
    function addGames(uint _id , string memory _gameName , string memory _player) public{
        games[_id] = Games(_gameName , _player);
    }
    function addMyBooks(uint _id , string memory _title , string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title , _author);
    }

    
}
