require "csv"
require "pry"

class ATM
  # attr_accessor :user_data

  def initialize
    @user_data = []
    @exit = false
    users
  end

  def users
    CSV.foreach("bank_users.csv", headers: true, header_converters: :symbol) do |row|
      @user_data.push row.to_hash
    #  @user_data.push row[:balance].to_i
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
      puts "Balance $#{@user_hash[:balance].to_i}"
    elsif selection == 2
      # Withdraw money, rewrite CSV
      withdraw
    elsif selection == 3
      puts "Please come again."
      @exit = true
    else
      puts "#{selection} is not an available option. Please select from the options available."
    end
  end

  def withdraw
    puts "Balance $#{@user_hash[:balance].to_i}"
    puts "How much would you like to withdraw?"
    amount = gets.chomp.to_i
    if @user_hash[:balance].to_i > amount
      @user_hash[:balance].to_i -= amount
    else
      puts "Insufficient funds."
    end
      CSV.open("bank_users.csv", "wb") do |csv|
        user_data.each do |row|
          csv << [row[:name], row[:pin], row[:balance]]
        end
      end
    end

    def exit?
      @exit == true
    end
  end

  a = ATM.new



  a.access_atm

  if a.logged_in?
    a.atm_menu
  elsif a.exit?
  else
    puts "Invalid name or PIN"
  end
