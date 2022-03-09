pragma solidity ^0.8.0;
import "./ERC20.sol";

contract PrimerContrato{

    address owner;
    ERC20Basic token;

    constructor() public{
        owner = msg.sender;
        token = new ERC20Basic(1000);
    }

}
