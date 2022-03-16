pragma solidity ^0.8.0;

contract bucle_for{

    // Suma de los 100 primeros numeros a partir del número introducido
    function SumaCienPrimerosNumeros(uint _numero) public pure returns(uint){
        uint suma = 0;
        for(uint i = _numero; i<(100+_numero); i++){
            suma = suma+i;
        }
        return suma;
    }

    address[] direcciones;
    function asociar() public{
        direcciones.push(msg.sender);
    }
    function ComprobarAsociacion() public view returns(bool, address){
        // bool EstaContenido;
        for(uint i=0; i<direcciones.length; i++){
            if(msg.sender==direcciones[i]){
            /*
                EstaContenido = true;
            }
            else{
                EstaContenido = false;
            }
        }
        return (EstaContenido, msg.sender);
        */
                return (true, direcciones[i]);
            }
        }
    }
}