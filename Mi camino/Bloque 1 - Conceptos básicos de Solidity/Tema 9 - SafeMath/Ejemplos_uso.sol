pragma solidity ^0.8.0;
import "./SafeMath.sol";

contract CalculosSeguros{

    // Debemos declarar para que datos usaremos la libreria
    using SafeMath for uint;

    // Función suma segura
    function suma(uint _a, uint _b) public pure returns(uint){
        return _a.add(_b);
    }

    // Función resta segura
    function resta(uint _a, uint _b) public pure returns(uint){
        return _a.sub(_b);
    }

    // Función multiplicacion segura
    function multiplicacion(uint _a, uint _b) public pure returns(uint){
        return _a.mul(_b);
    }

}