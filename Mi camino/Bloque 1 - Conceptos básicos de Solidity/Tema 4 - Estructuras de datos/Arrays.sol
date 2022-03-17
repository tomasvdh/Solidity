pragma solidity ^0.8.0;

contract Arrays{

    /* Arrays primitivos*/
    // Array de enteros de longitud fija 5
    uint [5] public array_enteros_fijo = [1,2,3];

    // Array de enteros de 32bits de longitud fija 7
    uint32[7] array_enteros_32bits_fijo;

    // Array de strings de longitud fija 15
    string [15] array_cadenas_fijo;

    // Array de enteros dinámico
    uint[] public array_enteros_dinamico;

    /* Array de tipos de datos complejos */
    // Array de tipo Persona dinámico
    struct Persona{
        string nombre;
        uint edad;
    }

    Persona[] public array_personas_dinamico;

    /* Modificar y acceder a posiciones de un array */
    function funcion_push_entero(uint _numero) public{
        array_enteros_dinamico.push(_numero);
    }

    function funcion_push_Persona(string memory _nombre, uint _edad) public{
        array_personas_dinamico.push(Persona(_nombre,_edad));
    }

    function funcion_posicion_entero(uint _posicion, uint _numero) public{
        array_enteros_fijo[_posicion]=_numero;
    }

    uint public test  = array_enteros_fijo[2];

}