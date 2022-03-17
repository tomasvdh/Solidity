// Indicar la versión
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract hash{

    // Computo del hash de un string
    function CalcularHash(string memory _cadena) public view returns(bytes32){
        return keccak256(abi.encodePacked(_cadena));
    }
    
    // Computo del hash de un string, un entero y una dirección
        function CalcularHash2(string memory _cadena, uint _k, address _direccion) public view returns(bytes32){
        return keccak256(abi.encodePacked(_cadena, _k, _direccion));
    }

    /* Computo del hash de un string, un entero, una dirección, y un string y un entero
    que no están dentro de una variable */
        function CalcularHash3(string memory _cadena, uint _k, address _direccion) public view returns(bytes32){
        return keccak256(abi.encodePacked(_cadena, _k, _direccion, "hola", uint(2)));
    }

}