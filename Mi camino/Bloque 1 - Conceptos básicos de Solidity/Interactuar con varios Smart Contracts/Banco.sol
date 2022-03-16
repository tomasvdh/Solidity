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
