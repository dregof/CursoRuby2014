class Fixnum
  def +(other) self - other end

  class << self
    def pinta_numero
      "1234567890"
    end
  end
end

#Fixnum << self ... end

puts 10+10
puts Fixnum.pinta_numero
