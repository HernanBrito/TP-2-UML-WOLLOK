import empleados.*
import empresa.*

class ReciboHaberes {
  var property nombreEmpleado = ""
  var property direccion = ""
  var property fechaEmision = new Date()
  var property sueldoBruto = 0
  var property sueldoNeto = 0
  var property conceptos = []


  method generarRecibo(empleado) {
    self.nombreEmpleado(empleado.nombre())
    self.direccion(empleado.direccion())
    self.fechaEmision(new Date())
    self.sueldoBruto(empleado.calcularSueldoBruto())
    self.sueldoNeto(empleado.calcularSueldoNeto())
    conceptos.add(empleado.conceptos())
    //conceptos.clear()
    //conceptos.addAll(empleado.conceptos())
  }

  method generarRebibo1(empleado){
    empleado.conceptos()
  }

}



