require "csv"
require "pry"

class ATM
  attr_accessor :user_data

  def initialize
    @user_data = []
    users
  end

  def users
    CSV.foreach("bank_users.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
      user_data.push row.to_hash
      end
  end

  def access_atm
    prompt = ">"
    puts "Please enter your name."
    print prompt
    user_name = gets.chomp
    puts "Please enter your PIN."
    user_pin = gets.chomp
    user_hash = nil
  end
end

a = ATM.new

  a.access_atm
binding.pry
  a.user_data.each do |hash|
    if hash[:name] == user_name && hash[:pin] == user_pin
      #user_hash = hash
      puts user_hash
    end
  end

  unless user_hash = hash
    a.access_atm
  end

  puts "Choose an option."
  puts "1 - Check Balance"
  puts "2 - Withdrawal"
  puts "3 - Exit"
