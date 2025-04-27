import empleados.*
import reciboHaberes.*

class Empresa{
    var property nombre; // Strings
    var property cuit; // Strings
    const property empleados = [];

    method agregarEmpleado(empleado){
        empleados.add(empleado)
    }

    method calcularTotalSueldosNetos(){
        return empleados.sum{empleado => empleado.calcularSueldoNeto()}
    }

    method calcularTotalSueldosBrutos(){
        return empleados.sum{empleado => empleado.calcularSueldoBruto()}
    }

    method calcularTotalRetenciones(){
        return empleados.sum{empleado => empleado.calcularRetenciones()}
    }

    method liquidarSueldos() {
        return empleados.map { empleado => 
            const recibo = new ReciboHaberes()
            recibo.generarRecibo(empleado)
            recibo
        }
    }

    //method liquidarSueldos(recibo){
    //    empleados.forEach{empleado => recibo.generarRecibo(empleado)}
    //}

}