//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

// -----------------------------------
//  CANDIDATO   |   EDAD   |      ID
// -----------------------------------
//  Toni        |    20    |    12345X
//  Alberto     |    23    |    54321T
//  Joan        |    21    |    98765P
//  Javier      |    19    |    56789W

contract votacion{

    // Dirección del propietario del contrato
    address public owner;

    // Constructor
    constructor(){
        owner = msg.sender;
    }

    // Relación entre el nombre del candidato y el hash de sus datos personales
    mapping(string => bytes32) id_candidato;

    // Relación entre el nombre del candidato y el numero de votos
    mapping(string => uint) votos_candidato;

    // Lista para almacenar los nombres de los candidatos
    string [] candidatos;

    


    

}
