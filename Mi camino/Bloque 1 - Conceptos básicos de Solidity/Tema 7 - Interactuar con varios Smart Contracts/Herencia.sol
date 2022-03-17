pragma solidity ^0.8.0;

contract Banco{
    // Definir un tipo de dato complejo
    struct cliente{
        string _nombre;
        address _direccion;
        uint _dinero;
    }
    // Mapping que relaciona el nombre de cliente con el tipo de dato cliente
    mapping(string => cliente) clientes;
    // Función que nos permita dar de alta un nuevo cliente
    function NuevoCliente(string memory _nombre) public{
        clientes[_nombre] = cliente(_nombre, msg.sender, 0);
    }
}

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