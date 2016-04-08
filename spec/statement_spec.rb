require 'statement'

describe Statement do
  it 'initializes with a balance of 0' do
    statement = Statement.new
    expect(statement.balance).to eq 0
  end

  context '#deposit' do
    it 'allows user to add to balance' do
      statement = Statement.new
      statement.deposit 100
      expect(statement.balance).to eq 100
    end
  end

  context '#withdraw' do
    it 'allows user to make withdrawals' do
      statement = Statement.new
      statement.deposit 100
      statement.withdraw 50
      expect(statement.balance).to eq 50
    end
  end

end
