pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract Funciones{

    // Añadir dentro de un array de direcciones, la direccion de la persona que llame a la funcion
    address[] public direcciones;
    function nuevaDireccion() public{
        direcciones.push(msg.sender);
    }

    // Calcular el hash de los datos proporcionados como parámetro
    bytes32 public Calcular_hash_dato;
    function Insertar_dato(string memory _dato) public{
        Calcular_hash_dato = keccak256(abi.encodePacked(_dato));
    }


    // Declarar un tipo de dato complejo
    struct comida{
        string nombre;
        string ingredientes;
    }
    // Crear un tipo de dato complejo con una funcion
    comida public Hamburguesa;
    function Hamburguesas(string memory _nombre, string memory _ingredientes) public{
        Hamburguesa = comida(_nombre, _ingredientes);
    }

    // Ejemplo de una funcion privada
    // Declaramos un tipo de dato complejo
    struct alumno{
        string nombre;
        address direccion;
        uint edad;
    }

    bytes32 public hash_id_alumno;
    // Calcular el hash mediante la funcion privada
    function HashIdAlumno(string memory _nombre, address _direccion, uint _edad) private{
        hash_id_alumno = keccak256(abi.encodePacked(_nombre, _direccion, _edad));
    }
    // Guardamos con la funcion publica dentro de una lista los alumnos
    alumno[] public lista;
    mapping (string => bytes32) alumnos;

    function NuevoAlumno(string memory _nombre, uint _edad) public{
        lista.push(alumno(_nombre, msg.sender, _edad));
        HashIdAlumno(_nombre, msg.sender, _edad);
        alumnos[_nombre] = hash_id_alumno;
    }

}