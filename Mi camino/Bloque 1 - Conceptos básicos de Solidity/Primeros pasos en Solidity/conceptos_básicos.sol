// Indicar la versión
pragma solidity ^0.8.0;
// Importar el archivo ERC20.sol que está en nuestro directorio de trabajo
import "./ERC20.sol";

// Nuestro primer contrato
contract PrimerContrato{

    // En esta variable se encuentra la dirección de la persona que despliega el contrato
    address owner;
    ERC20Basic token;

    /* 
    Guardamos en la variable owner la dirección de la persona que despliega el contrato
    Inicializamos el número de tokens
    */
    constructor() public{
        owner = msg.sender;
        token = new ERC20Basic(1000);
    }

}

