require 'statement'

describe Statement do

  let(:subject) { described_class.new }

  context '#initialize'do
    it 'with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'with an empty receipt' do
      expect(subject.receipt).to be_empty
    end
  end

  context '#deposit' do
    it 'allows user to add to balance' do
      subject.deposit 100
      expect(subject.balance).to eq 100
    end

    it 'adds info to receipt' do
      expect(subject.deposit(100)).to eq ["DATE: #{Date.today.to_s} || DEPOSIT: 100 || BALANCE: 100"]
    end
  end

  context '#withdraw' do
    it 'allows user to make withdrawals' do
      subject.deposit 100
      subject.withdraw 50
      expect(subject.balance).to eq 50
    end

    it 'adds info to receipt' do
      subject.deposit(100)
      expect(subject.withdraw(50)).to include "DATE: #{Date.today.to_s} || WITHDRAW: 50 || BALANCE: 50"
    end
  end

  context '#print_statement' do
    it 'allows user to print statement' do
      subject.deposit(100)
      subject.deposit(200)
      subject.withdraw(150)
      expect(subject.print_statement).to eq ["DATE: #{Date.today.to_s} || WITHDRAW: 150 || BALANCE: 150",
                                              "DATE: #{Date.today.to_s} || DEPOSIT: 200 || BALANCE: 300",
                                              "DATE: #{Date.today.to_s} || DEPOSIT: 100 || BALANCE: 100"]
    end
  end
end
