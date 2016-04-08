class Statement

  attr_reader :balance, :receipt

  def initialize
    @balance = 0
    @receipt = []
  end

  def deposit amount
    @balance += amount
    add_deposit_to_receipt amount
  end

  def withdraw amount
    @balance -= amount
    add_withdraw_to_receipt amount
  end

  def print_statement
    @receipt.reverse.map { |i| p i }
  end

  private

    def add_deposit_to_receipt amount
      @receipt << "DATE: #{Date.today.to_s} || DEPOSIT: #{amount} || BALANCE: #{@balance}"
      @receipt.join()
    end

    def add_withdraw_to_receipt amount
      @receipt << "DATE: #{Date.today.to_s} || WITHDREW: #{amount} || BALANCE: #{@balance}"
      @receipt.join()
    end
end
