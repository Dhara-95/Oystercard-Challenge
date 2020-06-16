class Oystercard
  attr_reader :balance, :in_journey, :maximum_balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
    @maximum_balance = MAXIMUM_BALANCE
  end

  def top_up(amount)
    fail "£#{MAXIMUM_BALANCE} top up limit exceeded!" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds" if @balance < 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(1)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
