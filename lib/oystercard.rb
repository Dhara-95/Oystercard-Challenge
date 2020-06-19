require_relative 'journey'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = [Journey.new]
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + @balance > MAXIMUM_BALANCE
     @balance += amount
  end

  def in_journey?
    !!@journeys[-1].entry_station
  end

  def touch_in(station)
    fail "Not enough money to travel." if @balance < MINIMUM_FARE
    @journeys[-1].begin_journey(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys[-1].end_journey(station)
    @journeys << Journey.new

  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
