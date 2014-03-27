module Examenes

  def puts_module
    puts "Examenes"
  end

  def hacer_examen(variable, nombre = "por defecto")
    #if block_given? || variable.class == Proc
    if variable.respond_to? :call
      variable.call nombre
    else
      puts "Examen realizado usando #{variable}"
    end
  end
end
