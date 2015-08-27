require "#{File.dirname(__FILE__)}/db_conn.rb"

class User < ActiveRecord::Base

end

users = User.all

users.each do |user|
  puts "#{user.name} con correo #{user.email}"
end
