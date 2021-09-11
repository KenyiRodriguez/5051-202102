import UIKit

//SOLID
/*
 
 Single responsability
 Open close
 Liskov sustitution
 Interface Segregation
 Dependency Inversion
 
 */

protocol Persona {
    var nombre: String { get set }
    var apellido: String { get set }
    var numeroDocu: String { get set }
}

protocol Empleado {
    var idEmpleado: String { get set }
    var sueldo: String { get set }
}

protocol Administrativos {
    var numeroOficina: String { get set }
}

class Alumno: Persona {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
}

class Profesor: Persona, Empleado {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
    var idEmpleado: String = ""
    var sueldo: String = ""
    var especialidad: String = ""
}

class Auxiliar: Persona, Empleado {
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
    var idEmpleado: String = ""
    var sueldo: String = ""
}

class Director: Persona, Empleado, Administrativos {
    var numeroOficina: String = ""
    var nombre: String = ""
    var apellido: String = ""
    var numeroDocu: String = ""
    var idEmpleado: String = ""
    var sueldo: String = ""
}

var arrayEmpleados: [Empleado] = []
arrayEmpleados.append(Auxiliar())
arrayEmpleados.append(Director())
arrayEmpleados.append(Profesor())

for empleado in arrayEmpleados {

}




//class Persona {
//    var nombre: String = ""
//    var apellido: String = ""
//    var numeroDocu: String = ""
//}
//
//class Empleado: Persona {
//    var idEmpleado: String = ""
//    var sueldo: String = ""
//}
//
//class Alumno: Persona {
//
//}
//
//class Profesor: Empleado {
//    var especialidad: String = ""
//}
//
//class Auxiliar: Empleado {
//
//}
//
//class Director: Empleado {
//
//}
//
//
//var arrayEmpleados: [Empleado] = []
//arrayEmpleados.append(Auxiliar())
//arrayEmpleados.append(Director())
//arrayEmpleados.append(Profesor())
//
//for empleado in arrayEmpleados {
//    empleado.
//}
