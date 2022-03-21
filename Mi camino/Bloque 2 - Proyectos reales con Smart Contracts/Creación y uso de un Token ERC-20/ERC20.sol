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
}

// Contrato 
contract ERC20Basic is IERC20{

    function totalSupply() public override view returns (uint256){
        return 0;
    }   

    function balaceOf(address _account) public override view returns(uint256){
        return 0;
    }

    function allowance(address _owner, address _spender) public override view returns(uint256){
        return 0;
    }
}