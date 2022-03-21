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
    address owner;

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

    // Lista de los hashes de la identidad de los votantes
    bytes32 [] votantes;

    // Función para presentarse a las elecciones
    function Representar(string memory _nombre, uint _edad, string memory _id) public{
        // Calcular el hash de los datos del candidato
        bytes32 hash_candidato = keccak256(abi.encodePacked(_nombre,_edad,_id));
        // Almacenar el hash de los datos del candidato que están ligados a su nombre
        id_candidato[_nombre] = hash_candidato;
        // Almacenar el nombre del candidato dentro de la lista de los candidatos
        candidatos.push(_nombre);
    }

    // Función para ver los candidatos que se han presentado
    function VerCandidatos() public view returns(string [] memory){
        // Devuelve la lista de los candidatos presentados
        return candidatos;
    }

    // Función para votar a un candidato
    function Votar(string memory _candidato) public{
        // Calcular el hash de la dirección de la persona que ejecuta esta función
        bytes32 hash_votante = keccak256(abi.encodePacked(msg.sender));
        // Verificar si el votante ya ha votado
        for(uint i=0; i<votantes.length; i++){
            // Requerir que la persona no haya votado
            require(votantes[i] != hash_votante, "Ya has votado previamente");
        }
        // Almacenamos el hash del votantante dentro de la lista de votantes
        votantes.push(hash_votante);
        // Añadimos un voto al candidato elegido
        votos_candidato[_candidato]++;
    }




    

}
