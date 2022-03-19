// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

// -----------------------------------
//  ALUMNO   |    ID    |      NOTA
// -----------------------------------
//  Marcos |    77755N    |      5
//  Joan   |    12345X    |      9
//  Maria  |    02468T    |      2
//  Marta  |    13579U    |      3
//  Alba   |    98765Z    |      5

contract notas{

    // Dirección del profesor
    address public profesor;

    // Constructor
    constructor(){
        profesor = msg.sender;
    }

    // Mapping para relacionar el hash de la identidad del alumno con su nota del examen.
    mapping(bytes32 => uint) Notas;

    // Array de los alumnos que piden revisión de examen
    string[] revisiones;

    // Eventos
    event alumno_evaluado(bytes32, uint);
    event evento_revision(string);

    // Función evaluar a alumnos
    function Evaluar(string memory _id_alumno, uint _nota_alumno) public UnicamenteProfesor(msg.sender){
        // Hash de la identificación del alumno
        bytes32 hash_id_alumno = keccak256(abi.encodePacked(_id_alumno));
        // Relación entre el hash de la identificación del alumno y su nota
        Notas[hash_id_alumno] = _nota_alumno;
        // Emisión del evento
        emit alumno_evaluado(hash_id_alumno, _nota_alumno);
    }

    // Control de las funciones ejecutables por el profesor
    modifier UnicamenteProfesor(address _direccion){
        // Requiere que la direccion introducida por parámetro sea igual al owner del contrato
        require(_direccion == profesor, "No tienes permisos para ejecutar esta funcion.");
        _;
    }

    // Función para ver las notas de un alumno
    function VerNotas(string memory _id_alumno) public view returns(uint){
        // Hash de la identificación del alumno
        bytes32 hash_id_alumno = keccak256(abi.encodePacked(_id_alumno));
        // Nota asociada al hash del alumno
        uint _nota_alumno = Notas[hash_id_alumno];
        // Visualizar la nota
        return _nota_alumno;
    }

    // Función para pedir una revisión del examen
    function Revision(string memory _id_alumno) public{
        // Almacenamiento de la identidad del alumno en un array
        revisiones.push(_id_alumno);
        // Emición del evento
        emit evento_revision(_id_alumno);
    }

    // Función para ver las revisiones solicitadas
    function VerRevisiones() public view UnicamenteProfesor(msg.sender) returns(string [] memory){
        // Devolver las identidades de los alumnos
        return revisiones;
    }
 }
