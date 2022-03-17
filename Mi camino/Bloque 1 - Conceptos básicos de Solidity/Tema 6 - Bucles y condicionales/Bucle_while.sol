pragma solidity ^0.8.0;

contract bucle_while{

    // Suma de números impare menores a 100
    function SumaImpares() public pure returns(uint){
        uint suma = 0;
        uint contador = 1;
        while(contador<100){
            if(contador%2!=0){
                suma = suma + contador;
            }
            contador++;
        }
        return suma;
    }

    // Esperar 5 segundos
    uint tiempo;
    function FijarTiempo() public{
        tiempo = block.timestamp;
    }

    function Espera() public view returns(bool){
        while(block.timestamp<(tiempo + 5 seconds)){
            return false;
        }
        return true;
    }

    // Siguiente número primo
    function SiguientePrimo(uint _numero) public pure returns(uint){
        uint contador = _numero+1;
        while(true){
            // Comprobamos si contador es primo
            uint auxiliar = 2;
            bool primo = true;
            while(auxiliar<contador){
                if(contador%auxiliar==0){
                    primo = false;
                    break;
                }
                auxiliar++;
            }
            if(primo==true){
                break;
            }
            contador++;
        }
        return contador;
    }
}