import empleados.*
import reciboHaberes.*
import empresa.*

// me arme este objeto para probar los prints

object prueba {
  const property permanente1 = new EmpleadoPermanente(
    cantidadHijos = 2,
    antiguedad = 10,
    nombre = "Jose",
    direccion = "Mite 7283",
    esSoltero = true,
    sueldoBasico = 160000.5,
    fechaNacimiento = new Date(day = 12, month = 5, year = 1990)
  )

    const permanente = new EmpleadoPermanente(
    cantidadHijos = 2,
    antiguedad = 10,
    nombre = "Ana",
    direccion = "Calle 123",
    esSoltero = false,
    sueldoBasico = 50000,
    fechaNacimiento = new Date(day = 15, month = 5, year = 1980)
  )
  
  const temporal = new EmpleadoTemporal(
    nombre = "Luis",
    direccion = "Avenida 456",
    esSoltero = true,
    fechaNacimiento = new Date(day = 20, month = 8, year = 1970),
    sueldoBasico = 40000,
    fechaFinDesignacion = new Date(day = 31, month = 11, year = 2025),
    cantidadHorasExtras = 5
  )
  
  const contratado = new EmpleadoContratado(
    nombre = "María",
    direccion = "Boulevard 789",
    esSoltero = true,
    fechaNacimiento = new Date(day = 10, month = 2, year = 1990),
    sueldoBasico = 45000,
    numContrato = 123,
    medioDePago = "Transferencia"
  )
  //cantidadHijos, antiguedad, nombre, direccion, esSoltero fechaNacimiento, sueldoBasico

    const property empresa = new Empresa(nombre = "Mi Empresa", cuit = "30-12345678-9")
    const property recibo = new ReciboHaberes()

      method pruebaLiquidacion() {
        empresa.agregarEmpleado(permanente1)
        empresa.agregarEmpleado(temporal)
        empresa.agregarEmpleado(permanente)
        empresa.agregarEmpleado(contratado)

        const recibos = empresa.liquidarSueldos()

        recibos.forEach { recibo => 
            console.println("Recibo de: " + recibo.nombreEmpleado())
            console.println("Sueldo Neto: " + recibo.sueldoNeto().toString())
            console.println("Conceptos:")
            recibo.conceptos().forEach { concepto => console.println("- " + concepto) }
            console.println("--------------------")
        }
    }


}