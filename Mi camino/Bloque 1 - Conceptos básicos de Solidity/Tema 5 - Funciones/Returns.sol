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

    // Función que devuelve true si el número es par, y false si el número es impar
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

    // Función que devuelve el cociente y el residuo de una división
    // Además devuelve una variable booleana que es true si el residuo es 0 y false en caso contrario
    function division(uint _a, uint _b) public pure returns(uint, uint, bool){
        uint q = _a/_b;
        uint r = _a%_b;
        bool multiplo;
        if(r==0){
            multiplo=true;
        }
        else{
            multiplo=false;
        }
        return(q,r,multiplo);
    }

    // Práctica para el manejo de los valores devueltos
    function numeros() public pure returns(uint, uint, uint , uint , uint, uint){
        return (1,2,3,4,5,6);
    }
    // Asignación multiple
    function todos_los_valores() pure public{
        // Declaración de las variables donde se guardan los valores de retorno de la función numeros
        uint a;
        uint b;
        uint c;
        uint d;
        uint e;
        uint f;
        // Realización de la asignación múltiple
        (a,b,c,d,e,f)=numeros();
    }
    // Asignación de un subconjunto
    function ultimo_valor() pure public{
        (,,,,,uint ultimo)=numeros();
    }
}