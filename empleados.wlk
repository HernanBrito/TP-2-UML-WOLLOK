class Empleado {
  var property nombre; //strings
  var property direccion; //strings
  var property esSoltero; // estadoCivil BOOLEAN
  var property fechaNacimiento; //date
  var property sueldoBasico; //double
  const property concepto = []; //conceptos
  const hoy = new Date();



method calcularEdad() {  
  const añoActual = hoy.year()
  const mesActual = hoy.month()
  const diaActual = hoy.day()
  
  const añoNacimiento = self.fechaNacimiento().year()
  const mesNacimiento = self.fechaNacimiento().month()
  const diaNacimiento = self.fechaNacimiento().day()
  
  var edad = añoActual - añoNacimiento
  
  if (mesActual < mesNacimiento || (mesActual == mesNacimiento && diaActual < diaNacimiento)) {
    edad = edad - 1
  }
  
  return edad
}

  method conceptos()
  method calcularSueldoBruto()
  method calcularRetenciones()

  method calcularSueldoNeto(){
    return self.calcularSueldoBruto() - self.calcularRetenciones()
  }

}

class EmpleadoPermanente inherits Empleado {
  var property cantidadHijos; //Int
  var property antiguedad; //Int años de antiguedad

  method valorPorConyuge(){
    if(not self.esSoltero()) {return 100}else{return 0 }
  }

  method valorPorAntiguedad(){
    return (antiguedad * 50)
  }

  method salarioFamiliar(){
    return ((150 * cantidadHijos) + self.valorPorConyuge() + self.valorPorAntiguedad())
  }

  override method calcularSueldoBruto(){
    return self.sueldoBasico() + self.salarioFamiliar()
  }

  override method calcularRetenciones(){
    const sueldoBruto = self.calcularSueldoBruto();
    const obraSocial = (0.10 * sueldoBruto) + (20 * cantidadHijos);
    const jubilacion = 0.15 * sueldoBruto;
    return (obraSocial + jubilacion); 
  }

  override method conceptos() {
    concepto.clear()
    concepto.addAll([
      "Sueldo Básico: " + self.sueldoBasico().toString(),
      "Asignación por hijo: " + (self.cantidadHijos() * 150).toString(),
      "Asignación por cónyuge: " + self.valorPorConyuge().toString(),
      "Antigüedad: " + self.valorPorAntiguedad().toString(),
      "Obra social: " + ((self.calcularSueldoBruto() * 0.10 + 20 * self.cantidadHijos()).toString()),
      "Jubilación: " + (self.calcularSueldoBruto() * 0.15).toString()
    ])
  return concepto
}


}

class EmpleadoTemporal inherits Empleado {
  var property fechaFinDesignacion; //Date
  var property cantidadHorasExtras; //Int

  method esMayorDe50(){
    return (self.calcularEdad() > 50)
  }

  method retencionPorEdad(){
    if(self.esMayorDe50()){ return 25 }else{ return 0 }
  }

  override method calcularSueldoBruto(){
    return self.sueldoBasico() + (40 * self.cantidadHorasExtras());
  }

  override method calcularRetenciones(){
    const sueldoBruto = self.calcularSueldoBruto();
    const obraSocial = ((0.10 * sueldoBruto) + self.retencionPorEdad())
    const jubilacion = ((0.10 * sueldoBruto) + (5 * self.cantidadHorasExtras()))

    return obraSocial + jubilacion
  }

  override method conceptos() {
  concepto.clear()
  concepto.addAll([
    "Sueldo Básico: " + self.sueldoBasico().toString(),
    "Horas extras: " + (self.cantidadHorasExtras() * 40).toString(),
    "Obra social: " + ((self.calcularSueldoBruto() * 0.10 + self.retencionPorEdad()).toString()),
    "Jubilación: " + ((self.calcularSueldoBruto() * 0.10 + 5 * self.cantidadHorasExtras()).toString())
  ])
  return concepto
}


}

class EmpleadoContratado inherits Empleado {
  var property numContrato;//Int
  var property medioDePago;//Strings

  override method calcularSueldoBruto(){
    return sueldoBasico;
  }

  override method calcularRetenciones(){
    return 50;
  }

  override method conceptos() {
    concepto.addAll([
      "Sueldo Básico: " + self.sueldoBasico().toString(),
      "Gastos Administrativos Contractuales: 50",
      "Medio de pago: " + self.medioDePago()
    ])
  return concepto
}

}
