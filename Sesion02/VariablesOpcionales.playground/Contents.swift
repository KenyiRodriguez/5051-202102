import UIKit

//***************** VARIABLES OPCIONALES ****************
/*
 
    * Son propensas al fallo
    * Pueden guardar un dato o un nulo
    * No almacenan directamente el dato, lo que guardan es una dirección de memoria al dato
    * Son variables especiales
    * NO PUEDEN SER TRATADAS COMO UNA VARIABLE NORMAL
 
 */
var nombre: String? = nil//"Kenyi"
var apellido: String = "Rodriguez"

// Operador unwrap
/*
    SÓLO SE PUEDE APLICAR A UNA VARIABLE OPCIONAL
    Esta definido por los siguientes símbolos (??)
    Sirve para desempaquetar el dato de una variable opcional
    En caso en el proceso se encuentre un nulo (nil) este operador te permite setear un valor por defecto.
 
 */


let nombreCompleto = "Nombre: \(nombre ?? "No definido")\nApellido: \(apellido)"
print(nombreCompleto)



func sumarNumero1(_ n1: Int?, conNumero2 n2: Int?) -> Int {
    
    let n1Seguro = n1 ?? 0
    let n2Seguro = n2 ?? 0
    
    let suma = n1Seguro + n2Seguro
    return suma
}

let suma = sumarNumero1(8, conNumero2: 5)
print("La suma es: \(suma)")


//********* Guard var / let *************
/*
    sirve para crear una variable segura. Es decir, una variable distinta de nil
    Maneja errores y corta el flujo en caso encuentre uno
    Sólo se puede usar dentro de una función
 */

print("***********************\n")

func sumarGuardNumero1(_ n1: Int?, conNumero2 n2: Int?) -> Int? {
    
    guard let n1 = n1 else {
        print("El número 1 ingresado es incorrecto")
        //MÁS CÓDIGO
        return nil
    }

    guard let n2 = n2 else {
        print("El número 2 ingresado es incorrecto")
        //MÁS CÓDIGO
        return nil
    }
        
    let suma = n1 + n2
    return suma
}

let resultado = sumarGuardNumero1(nil, conNumero2: 5)
print(resultado ?? "La suma es incorrecta")


func registrarUsuario(_ nombre: String?, apellido: String?) {
    
    guard
        let nombre = nombre,
        nombre.count > 2
    else {
        print("Ingresa un nombre correcto")
        return
    }
    
    guard let apellido = apellido else {
        print("Ingresa un apellido correcto")
        return
    }
    
    print("\(nombre) \(apellido) fue registrado con éxito")
}

registrarUsuario("ken", apellido: "Rodriguez")
