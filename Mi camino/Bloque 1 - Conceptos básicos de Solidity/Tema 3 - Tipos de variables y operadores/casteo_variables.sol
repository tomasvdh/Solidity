pragma solidity ^0.8.0;

contract casteo{

    // Ejemplos de casteo de variables
    uint8 entero_8bits = 42;
    uint64 entero_64bits = 60000;
    uint entero_256bits = 1000000;
    int16 entero_16bits = 156;
    int120 entero_120bits = 900000;
    int entero = 5000000;

    // Casteo de variables
    uint64 public casteo_1 = uint64(entero_8bits);
    uint64 public casteo_2 = uint64(entero_256bits);
    uint8 public casteo_3 = uint8(int8(entero_16bits));
    int public casteo_4 = int(entero_120bits);
    int public casteo_5 = int(entero_256bits);

    function convertir(uint _k) public pure returns(uint64){
        return uint64(_k);
    }

}