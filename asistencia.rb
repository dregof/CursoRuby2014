module Asistencia

  def Asistencia.confirmar(&bloque)
    bloque.call
  end

end
