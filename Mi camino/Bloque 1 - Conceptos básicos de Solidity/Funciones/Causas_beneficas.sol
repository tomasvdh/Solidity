pragma solidity ^0.8.0;

contract causas_beneficas{

    // Declaraciones necesarias
    struct Causa{
        uint id;
        string nombre;
        uint precio_objetivo;
        uint dinero_recaudado;
    }

    uint contador_causas=0;
    mapping (string => Causa) causas;

    // Función que permite dar de alta una nueva causa
    function nuevaCausa(string memory _nombre, uint _precio_objetivo) public payable{
        contador_causas = contador_causas++;
        // Causa memory causa = Causa(contador_causas, _nombre, _precio_objetivo, 0);
        causas[_nombre] = Causa(contador_causas, _nombre, _precio_objetivo, 0);
    }

    // Función que devuelve true en caso de que se pueda donar a una causa, y false en caso contrario
    function objetivoCumplido(string memory _nombre, uint _cantidad_a_donar) private view returns(bool){
        bool flag = false;
        Causa memory causa = causas[_nombre];
        if(causa.precio_objetivo >= (causa.dinero_recaudado+_cantidad_a_donar)){
            flag = true;
        }
        return flag;
    }

    // Función que permite donar a una causa
    function donarCausa(string memory _nombre, uint _cantidad_a_donar) public returns(bool){
        bool aceptar_donacion=true;
        if(objetivoCumplido(_nombre, _cantidad_a_donar)){
            causas[_nombre].dinero_recaudado = (causas[_nombre].dinero_recaudado+_cantidad_a_donar);
        }
        else{
            aceptar_donacion=false;
        }
        return aceptar_donacion;
    }

    // Función que dice si se ha llegado al precio objetivo
    function ComprobarPrecioObjetivo(string memory _nombre) public view returns(bool, uint){
        bool limite_alcanzado = false;
        Causa memory causa = causas[_nombre];
        if(causa.dinero_recaudado>=causa.precio_objetivo){
            limite_alcanzado = true;
        }
        return (limite_alcanzado, causa.dinero_recaudado);
    }
}