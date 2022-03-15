pragma solidity ^0.8.0;

contract sentencia_if{

    // Número ganador
    function ProbarSuerte(uint _numero) public pure returns(bool){
        bool ganador;
        if(_numero==157){
            ganador = true;
        }
        else{
            ganador = false;
        }
        /* 
        bool ganador = false;
        if(_numero==157){ 
            ganador = true;
        }
        */
        return ganador;
    }

    // Calcular el valor absoluto
    function CalcularValorAbsoluto(int _numero) public pure returns(uint){
        uint numero_valor_absoluto;
        if(_numero<0){
            numero_valor_absoluto = uint(-_numero);
        }
        else{
            numero_valor_absoluto = uint(_numero);
        }
        return numero_valor_absoluto;
    }
}