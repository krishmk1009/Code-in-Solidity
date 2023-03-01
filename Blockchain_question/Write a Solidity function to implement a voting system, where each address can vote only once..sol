// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract votingSys{
    mapping (string=>uint) public votes;
    mapping (address=>bool) public hasVoted;
    string[3] public candidates;

    constructor(string[3] memory _candidates){
        candidates = _candidates;

        for(uint i=0 ; i<candidates.length;i++){
            votes[candidates[i]]=0;
        }
    }
    event voteDone(address indexed voter , string _candidateName);

    function countVote(string memory _nameOfCandidate) public view returns (uint){
        return votes[_nameOfCandidate];
    }

    function doVoting(uint _selectCandidate) public {
        require(!hasVoted[msg.sender] ,"you can vote only once, you have alredy voted");
        require(_selectCandidate >=1 && _selectCandidate < candidates.length, "invalid Candidate");

        string memory candidateName = candidates[_selectCandidate-1];

        
        votes[candidateName]++;
        hasVoted[msg.sender]= true;
        emit voteDone(msg.sender, candidateName);
        
    }


}
