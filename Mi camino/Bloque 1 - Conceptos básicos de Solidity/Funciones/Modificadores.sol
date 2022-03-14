pragma solidity ^0.8.0;

contract View_Pure_Payable{

    // Modificador de view
    string[] lista_alumnos;

    function nuevo_alumno(string memory _alumno) public{
        lista_alumnos.push(_alumno);
    }

    function ver_alumno(uint _posicion) public view returns(string memory){
        return lista_alumnos[_posicion];
    }


    uint x=10;
    function sumarAx(uint _numero) public view returns(uint){
        return x+_numero;
    }
}