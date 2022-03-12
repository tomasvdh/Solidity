// Indicar la versión
pragma solidity ^0.8.0;

// Crear el contrato
contract tiempo{

    // Unidades de tiempo
    uint public tiempo_actual = block.timestamp;
    uint public un_segundo = 1 seconds;
    uint public un_minuto = 1 minutes;
    uint public dos_horas = 2 hours;
    uint public seis_dias = 50 days;
    uint public dos_semanas = 2 weeks;

    // Función para sumar 30 segundos al ahora
    function MasSegundos() public view returns(uint){
        return block.timestamp + 30 seconds;
    }

    // Función para sumar 1 hora al ahora
    function MasHoras() public view returns(uint){
        return block.timestamp + 1 hours;
    }

    // Función para sumar 1 día al ahora
    function MasDias() public view returns(uint){
        return block.timestamp + 1 days;
    }

    // Función para sumar 1 semana al ahora
    function MasSemanas() public view returns(uint){
        return block.timestamp + 1 weeks;
    }


}