require 'test/unit'


class String
  def is_number?
    self =~ /^\d+$/
  end

  def humanize
    raise RuntimeError if self =~ /zombie/
    self.gsub("_", " ").capitalize
  end
end

##
# Test de ejemplo para probar el método is_number?
#
class StringTest < Test::Unit::TestCase

  def test_is_number
    assert "4".is_number?, "tiene que devolver true"
  end

  def test_is_not_a_number
    assert !"abc".is_number?
  end

  def test_string_respond_to_humanize
    assert_respond_to "pablo", :humanize, "debe responder al método humanize"
  end

  def test_humanize_not_return_nil
    assert_not_nil "pablo".humanize, "no debe devolver un objeto nil"
  end

  def test_valid_return_format
    assert_equal "pablo_formoso".humanize, "Pablo formoso", "debe devolver la expresión humanizada"
  end

  def test_a_zombie_cant_be_human
    assert_raise(RuntimeError) { "zombie".humanize }
  end

end

