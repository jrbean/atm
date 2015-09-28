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

# a = ATM.new
#   prompt = ">"
#   puts "Please enter your name."
#   print prompt
#
# while user_input = gets.chomp
#   case user_input
#   when a.user_data[:name].include? user_input
#     break
#   else
#     puts "Please enter a valid name."
#     print prompt
#   end
# end
