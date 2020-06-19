require_relative 'journey'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + @balance > MAXIMUM_BALANCE
     @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    fail "Not enough money to travel." if @balance < MINIMUM_FARE
    @journeys << Journey.new
    @journeys[-1].begin_journey(station)
    # @entry_station = station
  end

  def touch_out(station)
    # @exit_station = station
    deduct(MINIMUM_FARE)
    @journeys[-1].end_journey(station)
    # @journeys << {@entry_station => @exit_station}
    # @entry_station = nil
    # @exit_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
