require "csv"
require "pry"

class ATM
  attr_accessor :user_data

  def initialize
    self.user_data = []
    users
  end

  def users
    CSV.foreach("bank_users.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
      user_data.push row.to_hash
      end
  end
end

a = ATM.new
  prompt = ">"
  puts "Please enter your name."
  print prompt
  user_name = gets.chomp
  puts "Please enter your PIN."
  user_pin = gets.chomp
  user_hash = nil

  a.user_data.each do |hash|
    if a.user_data[:name] == user_name && a.user_data[:pin] == user_pin
      user_hash = hash
    end
  end
