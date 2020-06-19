require_relative "oystercard.rb"

class Journey
  attr_reader :entry_station, :exit_station

  def begin_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def fare

  end
end
