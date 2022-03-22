// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";

// Interface del token ERC20
interface IERC20{
    // Función que devuelve la cantidad de tokens en existencia
    function totalSupply() external view returns (uint256);

    // Función que devuelve la cantidad de tokens que tiene una dirección indicada por parámetro
    function balaceOf(address _account) external view returns(uint256);

    // Función que devuelve el número de tokens que el gastador (spender) podrá gastar en nombre del propietario (owner)
    function allowance(address _owner, address _spender) external view returns(uint256);

    // Función que devuelve un valor booleano con el esultado de la operación indicada
    function trasnfer(address _recipient, uint256 _amount) external returns(bool);

    // Función que devuelve un valor booleano con el resultado de la operación de gasto
    function approve(address _spender, uint256 _amount) external returns(bool);

    // Función que devuelve un valor booleano con el resultado de la operación de paso de una cantidad de tokeans usando el método allowance
    function transferFrom(address _sender, address _recipient, uint256 _amount) external returns(bool);



    // Evento que se debe emitir cuando una cantidad de tokens pase de un origen a un destino
    event Transfer(address indexed from, address indexed to, uint256 _tokens);

    // Evento que se debe emitir cuando se establece una asignación con el método allowance()
    event Approval(address indexed _owner, address indexed _spender, uint256 _tokens)
}

// Contrato 
contract ERC20Basic is IERC20{


    event Transfer(address indexed from, address indexed to, uint256 _tokens);
    event Approval(address indexed _owner, address indexed _spender, uint256 _tokens)


    function totalSupply() public override view returns (uint256){
        return 0;
    }   

    function balaceOf(address _account) public override view returns(uint256){
        return 0;
    }

    function allowance(address _owner, address _spender) public override view returns(uint256){
        return 0;
    }

    function trasnfer(address _recipient, uint _amount) public override returns(bool){
        return false;
    }

    function approve(address _spender, uint256 _amount) public override returns(bool){
        return false;
    }

    function transferFrom(address _sender, address _recipient, uint256 _amount) public override returns(bool){
        return false;
    }
}