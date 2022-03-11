// Indicar la versión
pragma solidity ^0.8.0

// Crear un contrato
contract enteros{

    // Variables enteras sin signo
    uint mi_primer_entero;
    uint mi_primer_entero_incializado = 3;
    uint cota = 5000;

    // Variables enteras sin signo con un número especifico de bits
    uint8 entero_8_bits;
    uint64 entero_64_bits = 7000;
    uint16 entero_16_bits;
    uint256 entero_256_bits;

    // Variables enteras con signo
    int mi_primer_entero_con_signo;
    int mi_numero = -32;
    int mi_numero_2 = 65

    // Variables enteras con signo con un número especifico de bits
    int72 entero_con_signo_72_bits;
    int240 entero_con_signo_240_bits = 9000;
    int256 entero_con_signo_256_bits = -10000;


}