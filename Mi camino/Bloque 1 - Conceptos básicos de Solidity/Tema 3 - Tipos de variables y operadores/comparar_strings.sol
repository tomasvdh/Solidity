pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract comprarar_strings{

    function Comparar(string memory _j, string memory _i) public pure returns(bool){

        bytes32 hash_i = keccak256(abi.encodePacked(_i));
        bytes32 hash_j = keccak256(abi.encodePacked(_j));

        if(hash_i == hash_j){
            return true;
        }
        else{
            return false;
        }
    }

}