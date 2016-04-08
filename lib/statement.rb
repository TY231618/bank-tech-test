class Statement

  attr_reader :balance, :receipt

  def initialize
    @balance = 0
    @receipt = []
  end

  def deposit amount
    @balance += amount
    @receipt << "DATE: #{Date.today.to_s} || DEPOSIT: #{amount} || BALANCE: #{@balance}"
  end

  def withdraw amount
    @balance -= amount
    @receipt << "DATE: #{Date.today.to_s} || WITHDRAW: #{amount} || BALANCE: #{@balance}"
  end

  def print_statement
    # array = @receipt
    @receipt.reverse.map { |i| p i }
  end
end
