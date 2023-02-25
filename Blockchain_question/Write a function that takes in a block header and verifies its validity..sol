// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract validityVerification{
    

    function verifyHeader(uint timestamp , bytes32 prevHash , bytes32 blockHash , uint nonce, uint dificultyTarget) public pure returns (bool) {
           bytes32 calculatedHash = calculateHash(timestamp , prevHash , nonce );

            return(calculatedHash==blockHash && uint(calculatedHash) <= dificultyTarget);
      
    }

    function calculateHash(uint timestamp  , bytes32 prevHash , uint nonce  ) public pure returns  (bytes32){
            return keccak256(abi.encodePacked(timestamp,prevHash , nonce));
    }
}

contract checkValidity {
      //Demo is just for generating the block hash , ignore it , actual code starts from 27
        validityVerification verification = new validityVerification();
        uint t1 = 1645756745;
        bytes32 p1 = 0x6a2f6a8a6d2bbd02fb69e5e66dd98323d49a4c4e4a48dc4c4b0f5b753d1c5d5f;
        uint n1 = 123456;
        bytes32 public demo   = keccak256(abi.encodePacked(t1,p1 , n1));

    function validityChecker() public view returns (bool){
        uint timestamp = 1645756745;
        bytes32 prevBlockHash = 0x6a2f6a8a6d2bbd02fb69e5e66dd98323d49a4c4e4a48dc4c4b0f5b753d1c5d5f;
        bytes32 blockHash = 0x9e16454965d8b4036fb9f7942abd4753ef9c74ea56cd7d4e47252031f9119292
;
        uint nonce = 123456;
        uint dificultyTarget = 0x00000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        

       bool result =  verification.verifyHeader(timestamp, prevBlockHash, blockHash, nonce, dificultyTarget);
       return result;

        
        
    }
    

}
