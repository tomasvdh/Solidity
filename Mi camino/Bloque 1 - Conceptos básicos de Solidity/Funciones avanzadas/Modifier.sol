pragma solidity ^0.8.0;

contract Modifier{
    // Ejemplo de solo propietario del contrato puede ejecutar una función
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier SoloPropietario(){
        require(msg.sender==owner, "No tienes permiso para ejecutar la funcion.");
        _;
    }
    function ejemplo1() public SoloPropietario(){
        // Codigo de la función para el propietario del contrato
    }

    
    // Ejemplo 2
    struct cliente{
        address _direccion;
        string _nombre;
    }
    mapping (string => address) clientes;
    function AltaCliente(string memory _nombre) public{
        clientes[_nombre] = msg.sender;
    }
    modifier SoloClientes(string memory _nombre){
        require(clientes[_nombre] == msg.sender);
        _;
    }
    function ejemplo2(string memory _nombre) public SoloClientes(_nombre){
        // Lógica de la función para los clientes
    }


    // Ejemplo de conducción
    modifier MayorDeEdad(uint _edad_minima, uint _edad_usuario){
        require(_edad_usuario>=_edad_minima);
        _;
    }
    function Conducir(uint _edad_usuario) public MayorDeEdad(16, _edad_usuario){
        // Codigo para ejecutar para los conductores mayores de edad
    }
}
