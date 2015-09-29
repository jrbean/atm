require "csv"
require "pry"

class ATM
  # attr_accessor :user_data

  def initialize
    @user_data = []
    users
  end

  def users
    CSV.foreach("bank_users.csv", headers: true, header_converters: :symbol) do |row|
      @user_data.push row.to_hash
      end
  end

  def access_atm
    prompt = ">"
    puts "Please enter your name."
    print prompt
    user_name = gets.chomp
    puts "Please enter your PIN."
    user_pin = gets.chomp
    @user_hash = nil
    @user_data.each do |hash|
      if hash[:name] == user_name && hash[:pin].to_s == user_pin
        @user_hash = hash
      end
    end
  end

  def logged_in?
    @user_hash != nil
  end

  def atm_menu
    puts "Choose an option."
    puts "1 - Check Balance"
    puts "2 - Withdrawal"
    puts "3 - Exit"

    selection = gets.chomp.to_i
    if selection == 1
      puts "#{@user_data[:balance].to_i}"
    elsif selection == 2
    elsif selection == 3
      puts "Please come again."
    else
      puts "#{selection} is not an available option. Please select from the options available."
    end
  end
end

a = ATM.new

  # loop

  a.access_atm

  if a.logged_in?
    a.atm_menu
  else
    puts "Invalid name or PIN"
  end
