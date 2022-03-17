// Indicar la versión
pragma solidity ^0.8.0;

contract funciones_globales{

    // Función msg.sender
    function MsgSender() public view returns(address){
        return msg.sender;
    }

    // Función block.timestamp
    function BlockTimestamp() public view returns(uint){
        return block.timestamp;
    }

    // Función block.coinbase
    function BlockCoinbase() public view returns(address){
        return block.coinbase;
    }

    // Función block.difficulty
    function BlockDifficulty() public view returns(uint){
        return block.difficulty;
    }

    // Función block.number
    function BlockNumber() public view returns(uint){
        return block.number;
    }

    // Función msg.sig
    function MsgSig() public view returns(bytes4){
        return msg.sig;
    }

    // Función tx.gasprice
    function TxGasprice() public view returns(uint){
        return tx.gasprice;
    }

}