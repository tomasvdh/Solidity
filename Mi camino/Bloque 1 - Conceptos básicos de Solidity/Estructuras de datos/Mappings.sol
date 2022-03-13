pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract Mappings{

    // Declarar un mapping para elegir un número
    mapping (address => uint) public elegirNumero;

    function elegir_numero(uint _numero) public{
        elegirNumero[msg.sender] = _numero;
    }

    function consultarNumero() public view returns(uint){
        return elegirNumero[msg.sender];
    }


    // Declarar un mapping que relaciona el nombre de una persona, con su cantidad de dinero
    mapping (string => uint) cantidadDinero;

    function Dinero(string memory _nombre, uint _cantidad) public{
        cantidadDinero[_nombre] = _cantidad;
    }

    function consultarDinero(string memory _nombre) public view returns(uint){
        return cantidadDinero[_nombre];
    }


    // Ejemplo de mapping con un tipo de dato complejo
    struct Persona{
        string nombre;
        uint edad;
    }

    mapping(uint => Persona) personas;

    function dni(uint _numeroDni, string memory nombre, uint edad) public{
        personas[_numeroDni] = Persona(nombre, edad);
    }

    function visualizarPersona(uint _dni) public view returns(Persona memory){
        return personas[_dni];
    }
}