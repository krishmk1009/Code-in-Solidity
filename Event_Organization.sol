// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;

contract Event{
    struct Event{
    address organiser;
    string name;
    uint price;
    uint date;
    uint ticketRemaining;
    uint ticketCount;

    }

    mapping(uint=> Event) public events;
    mapping(address=>mapping(uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(string memory name , uint price , uint date , uint ticketCount)external{
        require(date>block.timestamp , "you cannot create a event because current time is lesser");
        require(ticketCount>0, "you cannot create a event with zero ticket !! please check the tickets");

        events[nextId]= Event(msg.sender , name , price , date , ticketCount , ticketCount);
        nextId++;
    }

    function buyTickets(uint id, uint quantity) external payable {

        require(events[id].date!=0,"Event does not exists");
        require(events[id].date>block.timestamp,"event has been expired");
        Event storage _event = events[id];
        require(msg.value == (_event.price*quantity),"please pay the valid amount");
        require(_event.ticketRemaining>quantity,"not suffiecient tickets");
        _event.ticketRemaining-= quantity;
        tickets[msg.sender][id]+=quantity;
    }

    function transferTicket(uint id, uint quantity , address to) external{
        require(events[id].date!=0,"Event does not exists");
        require(events[id].date>block.timestamp,"event has been expired");
        require(tickets[msg.sender][id]>= quantity);
        tickets[msg.sender][id]-= quantity;
        tickets[to][id]+= quantity;
    }

}
