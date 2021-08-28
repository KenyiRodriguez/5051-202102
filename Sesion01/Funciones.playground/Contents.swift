import UIKit

//********************** FUNCIONES ***********************
/*
    func nombreFuncion(parametros) -> TipoDatoRetorno
 
    =====================================
    PARÁMETROS (alias variable: TipoDato)
    =====================================
    func nombreFuncion(alias1 variable1: Tipo1, alias2 variable2: Tipo2) -> TipoDatoRetorno
 
    * Alias (Se encarga de describir la variable)
        - Como "nombre" : Es la descripción de la variable
        - Como "_"      : La variable no tiene descripción
        - Como "vacio"  : La variable genera su propia autodescripción
 */

//Función con alias "vacio"
func sumar(numero1: Int, numero2: Int) -> Int {
    return numero1 + numero2
}
sumar(numero1: 5, numero2: 9)


//Función con alias "nombre o texto"
func sumar(numero1 n1: Int, conNumero2 n2: Int) -> Int {
    return n1 + n2
}
sumar(numero1: 5, conNumero2: 15)


//FORMAS RECOMENDADAS POR APPLE
func sumarNumero1(_ n1: Int, conNumero2 n2: Int) -> Int {
    return n1 + n2
}
sumarNumero1(5, conNumero2: 8)

func sumarNumero1(_ numero1: Int, numero2: Int) -> Int {
    return numero1 + numero2
}
sumarNumero1(6, numero2: 8)


//*********************************************************************
//************************* PELIGRO, NO USAR **************************
//*********************************************************************

//Función con alias "_" -> ESTO ES DE LOOSER
func sumar(_ numero1: Int, _ numero2: Int) -> Int {
    return numero1 + numero2
}
sumar(6, 10)




//******************* FUNCIONES CON PARÁMETROS DE ENVIO OPCIONAL *******************
func registrarUsuarioConNombre(_ nombre: String, apellido: String, sexo: String = "Masculino", pais: String = "Perú") {
    let datos = "\n\nNombre: \(nombre)\nApellido: \(apellido)\nSexo: \(sexo)\nPais: \(pais)"
    print(datos)
}

registrarUsuarioConNombre("Kenyi", apellido: "Rodriguez")
registrarUsuarioConNombre("Rodolfo", apellido: "León", pais: "México")
registrarUsuarioConNombre("Valeria", apellido: "Gutierrez", sexo: "Femenino")
registrarUsuarioConNombre("Angel", apellido: "Jimenez", sexo: "Masculino", pais: "España")
