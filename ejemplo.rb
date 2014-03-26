#encoding: UTF-8

=begin
# código de ejemplo
  * vamos a crear una clase
  * con sus métodos y atributos
=end

class Alumno

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


private

  def to_s
    "#{@apellidos}, #{@nombre} de #{@ciudad}"
  end
end

#al1 = Alumno.new("Pablo", "Formoso", "Oleiros")
#puts al1

al2 = Alumno.new({nombre: "Pablo", ciudad: "Muros"})
puts al2




