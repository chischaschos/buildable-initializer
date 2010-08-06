$LOAD_PATH << File.expand_path('../../lib' , __FILE__)

require 'rubygems'
require 'bundler'
Bundler.setup(:test)
require 'test/unit'
require 'buildable_initializer'
