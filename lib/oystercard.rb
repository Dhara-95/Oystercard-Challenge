class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "£#{MAXIMUM_BALANCE} top up limit exceeded!" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
end