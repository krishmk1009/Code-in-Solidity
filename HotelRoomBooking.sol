pragma solidity ^0.6.0;

contract hotel{
    address payable public owner;
    enum Statuses{vacant, occuppied}
    Statuses current_status;
    event occupant(address _occupant,uint value);

    constructor() public {
        owner = msg.sender;
        current_status = Statuses.vacant;
    }

    modifier onlyWhenVacant{
    require(current_status == Statuses.vacant , "no vacancy in the hotel");
    _;
    }

    modifier enoughAmount(uint _amount){
    require(msg.value >= _amount , "not enough amount" );
    _;
    }
    receive() external payable onlyWhenVacant enoughAmount(2 ether){
        current_status = Statuses.occuppied;
        owner.transfer( msg.value);
        emit occupant(msg.sender,msg.value);
    }
}
