require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class OnlyAttrReader
  attr_writer :x, :y
  extend Buildable::Initializer
end 

class OnlyAttrReaderTest <  Test::Unit::TestCase
  def test_expected_methods
    assert_equal(OnlyAttrReader.methods.grep(/builder/).length, 1, 'This class has to contain a builder')
    instance_methods = OnlyAttrReader.builder.methods
    assert_true(instance_methods.include?(:x))
    assert_true(OnlyAttrReader.builder.x.instance_of?(Buildable::Initializer::Builder))
    assert_true(instance_methods.include?(:y))
    assert_true(OnlyAttrReader.builder.y.instance_of?(Buildable::Initializer::Builder))
    assert_true(OnlyAttrReader.builder.x(1).y(2).instance_of?(Buildable::Initializer::Builder))
    assert_true(OnlyAttrReader.builder.x(1).y(2).build.instance_of?(OnlyAttrReader))
  end 
end
