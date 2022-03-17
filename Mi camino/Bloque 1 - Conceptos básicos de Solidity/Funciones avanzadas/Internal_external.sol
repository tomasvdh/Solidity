pragma solidity ^0.8.0;

contract Comida{
    struct plato{
        string _nombre;
        string _ingredientes;
        uint _tiempo_coccion;
    }
    // Array dinámico de platos
    plato [] platos;
    // Relacion con un mapping, el nombre del plato con sus ingredientes
    mapping(string => string) ingredientes;
    // Función nuevo plato
    function NuevoPlato(string memory _nombre, string memory _ingredientes, uint _tiempo_coccion) internal{
        platos.push(plato(_nombre, _ingredientes, _tiempo_coccion));
        ingredientes[_nombre] = _ingredientes;
    }

    function Ingredientes(string memory _nombre) internal view returns(string memory){
        return ingredientes[_nombre];
    }
}

contract Sandwitch is Comida{
    
    function sandwitch(string memory _ingredientes, uint _tiempo_coccion) external{
        NuevoPlato("Sandwich", _ingredientes, _tiempo_coccion);
    }

    function VerIngredientes() external view returns(string memory){
        return Ingredientes("Sandwich");
    }

}