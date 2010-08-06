require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class OnlyAttrReader
  attr_reader :x, :y
  extend Buildable::Initializer
end 

class OnlyAttrReaderTest <  Test::Unit::TestCase
  def test_expected_methods
    assert_equal(OnlyAttrReader.methods.grep(/builder/).length, 1, 'This class has to contain a builder')
    assert_equal(OnlyAttrReader.instance_methods.grep(/:build/).length, 1, 'This class has to be buildeable')
  end 
end
