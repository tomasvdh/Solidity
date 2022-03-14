pragma solidity ^0.8.0;

contract ValoresDeRetorno{

    // Función que devuelve un saludo
    function saludos() public pure returns(string memory){
        return "Saludos";
    }

    // Función que calcula el resultado de una multiplicación de dos números enteros
    function multiplicacion(uint _a,uint _b) public pure returns(uint){
        return _a*_b;
    }

    // Función para saber si el número entero es par o impar
    function EsNumeroPar(uint _numero) public pure returns(bool){

        bool flag;
        
        if(_numero%2==0){
            flag=true;
        }
        else{
            flag=false;
        }
        
        return flag;
    }

}