// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract randomNum {

   function generateSalt() view public returns (bytes32){
       return keccak256(abi.encodePacked(block.timestamp, block.difficulty));
   }

   function generateHash(string memory _value) public view returns (bytes32) {
       bytes32 salt = generateSalt();

       return keccak256(abi.encodePacked(_value , salt));
   }
}
