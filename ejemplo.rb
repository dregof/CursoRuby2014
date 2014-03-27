#encoding: UTF-8
require "./asistencia.rb"
require "./examenes.rb"


=begin
# código de ejemplo
  * vamos a crear una clase
  * con sus métodos y atributos
=end
class Alumno
  include Asistencia
  include Examenes

  @@numero_alumnos = 0
  FALTAS_PREMITIDAS = 2

  attr_accessor :nombre, :apellidos, :ciudad

  def initialize
    @nombre = "Pablo"
    @apellidos = "Formoso Estrada"
    @ciudad = "Perillo"
  end

  def initialize(nombre, apellidos, ciudad = "Santiago")
    @nombre = nombre
    @apellidos = apellidos
    @ciudad = ciudad
  end

  def initialize(params = {})
    defaults = {
      nombre: "Pablo",
      apellidos: "Formoso",
      ciudad: "Santiago"
    }
    defaults.merge! params

    @nombre = defaults[:nombre]
    @apellidos = defaults[:apellidos]
    @ciudad = defaults[:ciudad]
  end

  def confirmar
    Asistencia::confirmar do
      puts "asiste a clase"
    end
  end

private

  def to_s
    "#{@apellidos}, #{@nombre} de #{@ciudad}"
  end
end

#al1 = Alumno.new("Pablo", "Formoso", "Oleiros")
#puts al1

al2 = Alumno.new({nombre: "Pablo", ciudad: "Muros"})
puts al2
al2.puts_module

#Ejemplo bloque
al2.hacer_examen("Sin bloques")

var_block = Proc.new { |nombre|
  3.times { puts "hola #{nombre}" }
}
al2.hacer_examen(var_block, "pablo")

lambda_block = lambda { |nombre|
  puts "Hola #{nombre}"
}
al2.hacer_examen lambda_block

# No es correcta, los metodos del modulo no son de instancia
#al2.confirmar do
#  puts "Confirmada la asistenca a clase"
#end

al2.confirmar
Asistencia::confirmar do
  puts "estoy fuera"
end



