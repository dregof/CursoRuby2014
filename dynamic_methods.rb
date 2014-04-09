class Bicicleta
  #alias_method :subir_a, :bajar_a

  MARCA = ["primera", "segunda", "tercera"]

  def initialize(marcha = "punto_muerto")
    @marcha = marcha
  end

  # Dynamic methods definition
  MARCA.each { |marcha|
    define_method "subir_a_#{marcha}" do
      @marcha = marcha
      puts "#{self}"
    end

    define_method "bajar_a_#{marcha}" do
      @marcha = marcha
      puts "#{self}"
    end
  }

  def subir_a(marcha)
    send("subir_a_#{marcha}")
  end

  def method_missing(method, *args, &block)
    if method =~ /subir_a/
      @marcha = "punto_muerto"
      puts self
    else
      super
    end
  end

  def get_binding
    return binding
  end

  def to_s
    "La Bicicleta va en #{@marcha}"
  end
end

bici = Bicicleta.new
bici.subir_a_primera
bici.subir_a_segunda
bici.bajar_a_primera
bici.subir_a_tercera
bici.subir_a("primera")
bici.subir_a("cuarta")
bici.bajar_a("cuarta")
#bici.bajar_a_cuarta -> Raise NoMethodError

if bici.respond_to? "subir_a_primera"
  puts "responde al método dinámico"
end

# Evals
eval("puts 'Soy un eval'")
Bicicleta.class_eval("def self.marca; puts 'BMX'; end")
Bicicleta.marca

if Bicicleta.respond_to? "marca"
  puts "No responde al método con class_eval"
end

bici.instance_eval("def modelo; puts 'orbea 30x'; end")
bici.modelo
unless bici.respond_to? "modelo"
  puts "No responde al metodo modelo"
end

# Bindings + Evals
eval("puts @marcha", bici.get_binding)



















