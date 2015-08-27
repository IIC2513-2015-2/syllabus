require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :host => "localhost",
  :database => "iic2513",
  :username => "iic2513",
  :password => "iic2513"
)
