// Indicar la versión
pragma solidity ^0.8.0;

// Declarar un contrato
contract Ejemplo_enumeraciones{

    // Enumeración de interruptor
    enum estado {ON, OFF}

    // Variable de tipo enum
    estado state;

    function encender() public{
        state = estado.ON;
    }

    function fijarEstado(uint _k) public{
        state = estado(_k);
    }

    function Estado() public view returns(estado){
        return state; 
    }



    // Enumeración de direcciones
    enum direcciones {ARRIBA, ABAJO, DERECHA, IZQUIERDA}

    // Variable de tipo enum
    direcciones direccion;
    
    function arriba() public{
        direccion = direcciones.ARRIBA;
    }

    function abajo() public{
        direccion = direcciones.ABAJO;
    }

    function derecha() public{
        direccion = direcciones.DERECHA;
    }

    function izquierda() public{
        direccion = direcciones.IZQUIERDA;
    }

    function fijarDirecciones(uint _k) public{
        direccion = direcciones(_k);
    }

    function Direcciones() public view returns(direcciones){
        return direccion;
    }
}