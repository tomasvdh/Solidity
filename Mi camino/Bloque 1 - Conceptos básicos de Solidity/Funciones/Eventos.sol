pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract Eventos{

    // Declarar eventos a utilizar
    event nombre_evento_1 (string _nombrePersona);
    event nombre_evento_2 (string _nombrePersona, uint _edadPersona);
    event nombre_evento_3 (string, uint, address, bytes32);
    event abortarmision();

    function emitirEvento1(string memory _nombrePersona) public{
        emit nombre_evento_1(_nombrePersona);
    }

    function emitirEvento2(string memory _nombrePersona, uint _edadPersona) public{
        emit nombre_evento_2(_nombrePersona, _edadPersona);
    }

    function emitirEvento3(string memory _nombrePersona, uint _edadPersona) public{
        bytes32 hash_id = keccak256(abi.encodePacked(_nombrePersona,_edadPersona,msg.sender));
        emit nombre_evento_3(_nombrePersona,_edadPersona,msg.sender,hash_id);
    }

    function AbortarMision() public{
        emit abortarmision();
    }
}