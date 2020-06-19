require_relative "oystercard.rb"

class Journey
  attr_reader :entry_station, :exit_station
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def begin_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def end_journey?
    !@exit_station || !@entry_station
  end

  def in_journey?
    !@exit_station && !!@entry_station
  end

  def fare
    end_journey? ? PENALTY_FARE : MINIMUM_FARE
  end
end
