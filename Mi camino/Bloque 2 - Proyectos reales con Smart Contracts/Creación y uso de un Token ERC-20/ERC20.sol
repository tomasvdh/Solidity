// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";


// Tomás -> 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// Juan Pedro -> 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// Isabella -> 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db


// Interface del token ERC20
interface IERC20{
    // Función que devuelve la cantidad de tokens en existencia
    function totalSupply() external view returns (uint256);

    // Función que devuelve la cantidad de tokens que tiene una dirección indicada por parámetro
    function balaceOf(address _account) external view returns(uint256);

    // Función que devuelve el número de tokens que el delegado (delegate) podrá gastar en nombre del propietario (owner)
    function allowance(address _owner, address _delegate) external view returns(uint256);

    // Función que devuelve un valor booleano con el esultado de la operación indicada
    function transfer(address _recipient, uint256 _numTokens) external returns(bool);

    // Función que devuelve un valor booleano con el resultado de la operación de gasto
    function approve(address _delegate, uint256 _numTokens) external returns(bool);

    // Función que devuelve un valor booleano con el resultado de la operación de paso de una cantidad de tokeans usando el método allowance
    function transferFrom(address _sender, address _buyer, uint256 _numTokens) external returns(bool);



    // Evento que se debe emitir cuando una cantidad de tokens pase de un origen a un destino
    // event Transfer(address indexed from, address indexed to, uint256 _tokens);

    // Evento que se debe emitir cuando se establece una asignación con el método allowance()
    // event Approval(address indexed _owner, address indexed _spender, uint256 _tokens);
}

// Implementación de las funciones del token ERC20
contract ERC20Basic is IERC20{

    string public constant name = "ERC20BlockchainAZ";
    string public constant symbol = "ERC20";
    uint8 public constant decimals = 2;


    event Transfer(address indexed from, address indexed to, uint256 _tokens);
    event Approval(address indexed _owner, address indexed _delegate, uint256 _tokens);


    using SafeMath for uint256;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    uint256 totalSupply_; 

    constructor(uint256 initialSupply){
        totalSupply_ = initialSupply;
        balances[msg.sender] = totalSupply_;
    }


    function totalSupply() public override view returns (uint256){
        return totalSupply_;
    }
    
    function increaseTotalSupply(uint _newTokensAmmount) public{
        totalSupply_ += _newTokensAmmount;
        balances[msg.sender] += _newTokensAmmount;
    }

    function balaceOf(address _tokenOwner) public override view returns(uint256){
        return balances[_tokenOwner];
    }

    function allowance(address _owner, address _delegate) public override view returns(uint256){
        return allowed[_owner][_delegate];
    }

    function transfer(address _recipient, uint _numTokens) public override returns(bool){
        require(_numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(_numTokens);
        balances[_recipient] = balances[_recipient].add(_numTokens);
        emit Transfer(msg.sender, _recipient, _numTokens);
        return true;
    }

    function approve(address _delegate, uint256 _numTokens) public override returns(bool){
        allowed[msg.sender][_delegate] = _numTokens;
        emit Approval(msg.sender, _delegate, _numTokens);
        return true;
    }

    function transferFrom(address _owner, address _buyer, uint256 _numTokens) public override returns(bool){
        require(_numTokens <= balances[_owner]);
        require(_numTokens <= allowed[_owner][msg.sender]);
        balances[_owner] = balances[_owner].sub(_numTokens);
        allowed[_owner][msg.sender] = allowed[_owner][msg.sender].sub(_numTokens);
        balances[_buyer] = balances[_buyer].add(_numTokens);
        emit Transfer(_owner, _buyer, _numTokens);
        return true;
    }
}