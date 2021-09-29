class Oystercard

  def initialize(start_balance, card_limit,minimum_fare)
    @balance = start_balance
    @MAX_CARD_LIMIT = card_limit
    @card_in_use = false
    @minimum_fare = minimum_fare
    @entry_station = nil
    @exit_station = nil
    @journey_history = {}
  end

  attr_accessor :balance, :entry_station, :exit_station, :minimum_fare, :journey_history
  attr_reader :MAX_CARD_LIMIT

  def top_up(amount)
    raise "Maximum balance exceeded of £#{@MAX_CARD_LIMIT}" if @balance + amount >= @MAX_CARD_LIMIT
    @balance += amount
  end

  def deduct(fare)
    return @balance -= fare
  end
  private :deduct

  def in_journey?
    @card_in_use
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    raise "Insufficient funds must have minimum £1 balance" if @balance < 1
    @card_in_use = true
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    deduct(@minimum_fare)
    @card_in_use = false
  end

  def record_journey
    @journey_history = {
        "Entry Station: " => @entry_station,
        "Exit Station: " => @exit_station,
    }  
  end

end
