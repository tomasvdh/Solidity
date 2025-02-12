 pragma solidity ^0.8.0;

library Operaciones{
    function division(uint _i, uint _j) public pure returns(uint){
        require(_j>0, "No podemos dividir por 0");
        return _i/_j;
    }

    function multiplicacion(uint _i, uint _j) public pure returns(uint){
        if((_i==0)||(_j==0)){
            return 0;
        }
        else{
            return _i*_j; 
        }
        
    }
}

contract Calculos{
    using Operaciones for uint;

    function calculos(uint _a, uint _b) public pure returns(uint, uint){
        uint q = _a.division(_b);
        uint m = _a.multiplicacion(_b);
        return(q,m);
    }
}