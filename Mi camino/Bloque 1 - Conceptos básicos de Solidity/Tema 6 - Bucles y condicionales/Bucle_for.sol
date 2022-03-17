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


    // Esto es un array dinámico de direcciones
    address[] direcciones;
    // Función que añade una direccion al array
    function asociar() public{
        direcciones.push(msg.sender);
    }
    // Función para comprobar si la dirección está en el array de direcciones
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

    // Doble for: Suma de los 10 primeros factoriales
    // n! = n*(n-1)*(n-2)*...*2*1
    function SumaFactorial() public pure returns(uint){
        uint suma = 0;
        for(uint i=1; i<=10; i++){
            uint factorial = 1;
            for(uint j=2; j<=i; j++){
                factorial = factorial*j;
            }
            suma = suma + factorial;
        }
        return suma;
    }

}