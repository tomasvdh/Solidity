pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract View_Pure_Payable{

    // Modificador de View
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

    // Modificador de Pure
    function exponenciacion(uint _a, uint _b) public pure returns(uint){
        return _a**_b;
    }

    // Modificador de Payable

    mapping(address=>cartera) DineroCartera;

    struct cartera{
        address direccion_cuenta;
        uint dinero_cuenta;
    }

    function pagar(uint _cantidad) public payable{
        cartera memory mi_cartera;
        mi_cartera = cartera(msg.sender, _cantidad);
        DineroCartera[msg.sender] = mi_cartera;
    }

    function saldo() public view returns(cartera memory){
        return DineroCartera[msg.sender];
    }
}