pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

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

    // Devolver true si el número introducido es par y tiene tres cifras
    function EsParYTieneTresCirfras(uint _numero) public pure returns(bool){
        bool ParYTresCifras;
        if((_numero%2==0) && ((_numero/100)>=1)&&((_numero/100)<10)){
            ParYTresCifras = true;
        }
        else{
            ParYTresCifras = false;
        }
        return ParYTresCifras;
    }

    // Votación
    // Solo hay tres candidatos: Joan, Gabriel y Maria
    function Votar(string memory _candidato) public pure returns(string memory){
        string memory mensaje;
        if(keccak256(abi.encodePacked(_candidato))==keccak256(abi.encodePacked("Joan"))){
            mensaje = "Has votado correctamente a Joan.";
        }
        else{
            if(keccak256(abi.encodePacked(_candidato))==keccak256(abi.encodePacked("Gabriel"))){
                mensaje = "Has votado correctamente a Gabriel.";
            }
            else{
                if(keccak256(abi.encodePacked(_candidato))==keccak256(abi.encodePacked("Maria"))){
                    mensaje = "Has votado correctamente a Maria.";
                }
                else{
                    mensaje = "Has votado incorrectamente.";
                }
            }
        } 
         return mensaje;
    }
}