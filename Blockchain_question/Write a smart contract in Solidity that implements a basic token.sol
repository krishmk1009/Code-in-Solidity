// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract token{
    string public  name;
    string public  symbol;
    uint public total_supply;
    mapping (address=>uint) public  balances;
    address public  owner ;
     event transfer(address _from , address _to , uint _amount);

     modifier onlyOwner() {
         require(owner == msg.sender , "only owner of this contract can call this function");
         _;
     }

    constructor(){
        name = "mytoken";
        symbol ="mt";
        total_supply = 4500;
        owner = msg.sender;
        balances[owner]=total_supply;
    }

    function getName() public view  returns (string memory){
        return name;
    }

    function getSymbol() public view returns (string memory){
        return symbol;
    }

    function getBalance(address _acc)public view  returns (uint ){
        return balances[_acc];
    }

    function transferAm(address _to , uint _amount) public onlyOwner returns (bool) {
        require(balances[owner] >= _amount , "no suffiecient amount");
        balances[owner] -= _amount;
        balances[_to] += _amount;
        emit transfer(owner , _to ,_amount);
        return true;
    }

   


}
