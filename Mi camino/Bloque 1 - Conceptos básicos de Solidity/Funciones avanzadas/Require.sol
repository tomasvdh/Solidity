pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract Require{
    // Función para verificar contraseña
    function Password(string memory _password) public pure returns(string memory){
        require(keccak256(abi.encodePacked(_password))==keccak256(abi.encodePacked("12345")), "Password incorrecta.");
        return "Password correcta.";
    }
    // Función para pagar
    uint tiempo=0;
    uint public cartera = 0;
    function pagar(uint _cantidad) public returns(uint){
        require(block.timestamp > (tiempo + 5 seconds), "Aun no puedes pagar.");
        tiempo = block.timestamp;
        cartera = cartera + _cantidad;
        return cartera;
    }
    // Función con una lista
    string[] nombres;
    function NuevoNombre(string memory _nombre) public{
        for(uint i=0; i<nombres.length; i++){
            require(keccak256(abi.encodePacked(_nombre))==keccak256(abi.encodePacked(nombres[i])), "El nombre ya esta en la lista.");
        }
        nombres.push(_nombre);
    }

}