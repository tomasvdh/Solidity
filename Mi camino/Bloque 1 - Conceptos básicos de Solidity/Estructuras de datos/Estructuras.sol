pragma solidity ^0.8.0;

contract Estructuras{


    // Cliente de una página web de pago
    struct cliente{
        uint id;
        string password;
        string name;
        string mail;
        uint phone_number;
        uint creditcard_number;
        uint secret_creditcard_number;
    }
    // Declarar una variable de tipo cliente
    cliente cliente_1 = cliente(1,"1234567","Tomas","tomasitovdh@hotmail.com",01129836789,1234567891011121, 123)


    // Página de compra-venta de productos
    struct producto{
        uint id;
        string name;
        uint price;
    }
    // Declarar una variable de tipo producto
    producto producto1 = producto(1234,"Mani King",270)


    // Proyecto cooperativo de ONGs para ayudar en diversas causas
    struct ONG{
        string name;
        address direction;
    }

    struct causa{
        uint id;
        string name;
        uint precio_objetivo;

    }
    // Declarar una variable de tipo ONG y causa
    ONG Plinplin = ONG("Plinplin",0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)
    causa ayuda_a_niños = causa(1234,"Ayuda a niños",100000)

}