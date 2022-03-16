pragma solidity ^0.8.0;
import "./Banco.sol";

contract Cliente is Banco{

    function AltaCliente(string memory _nombre) public{
        NuevoCliente(_nombre);
    }

    function IngresarDinero(string memory _nombre, uint _cantidad) public{
        clientes[_nombre]._dinero = clientes[_nombre]._dinero + _cantidad;
    }

    function RetirarDinero (string memory _nombre, uint _cantidad) public returns(bool){
        bool retiro;
        if((int(clientes[_nombre]._dinero) - int(_cantidad)) >=0){
            clientes[_nombre]._dinero = clientes[_nombre]._dinero - _cantidad;
            retiro = true;
        }
        else{
            retiro = false;
        }
        return retiro;
    }

    function ConsultarDinero(string memory _nombre) public view returns(uint){
        return clientes[_nombre]._dinero;
    }
}