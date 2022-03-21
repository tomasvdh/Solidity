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

    // Función para ver los votos de un candidato
    function VerVotos(string memory _candidato) public view returns(uint){
        // Devolver el número de votos del candidato
        return votos_candidato[_candidato];
    }

    // Función auxiliar que transforma un uint a un string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }   

    // Función para hacer un seguimiento de las votaciones
    function VerResultados() public view returns(string memory){
        // Guardar en una variable string los candidatos con sus respectivos votos
        string memory resultados="";
        // Recorrer el array de candidatos para actualizar el string resultados
        for(uint i=0; i<candidatos.length;i++){
            // Actualizar el string resultados y añadir el candidato que ocupa la posición i de la lista de candidatos y su número de votos
            resultados = string(abi.encodePacked(resultados , "(" , candidatos[i] , "," , uint2str(VerVotos(candidatos[i])) , ")" , " "));
        }
        // Devolver los resultados
        return resultados;
    }

    // Función para ver el ganador de las votaciones
    function Ganador() public view returns(string memory){
        // La variable ganador va a contener el nombre del candidato ganador
        string memory ganador = candidatos[0];
        // La variable flag nos sirve para una situación de empate
        bool flag;
        // Recorrer el array de candidatos para determinar el candidato con un número mayor de votos
        for(uint i=1;i<candidatos.length;i++){
            // Comparar si el ganador ha sido superado por otro candidato
            if(votos_candidato[ganador] < votos_candidato[candidatos[i]]){
                ganador = candidatos[i];
                flag = false;
            }
            // Comparar si hay un empate entre los candidatos
            else{
                if(votos_candidato[ganador] == votos_candidato[candidatos[i]]){
                    flag = true;
                }
            }
        }
        // Comprobar si hay un empate entre los candidatos
        if(flag == true){
            // Informar del empate
            ganador = "Hay un empate entre los candidatos";
        }
        // Devolver
        return ganador;
    }
}
