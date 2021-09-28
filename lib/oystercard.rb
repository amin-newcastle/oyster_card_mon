class Oystercard

  def initialize
    @balance = 50
    @MAX_CARD_LIMIT = 90
    @card_in_use = false
  end

  attr_accessor :balance
  attr_reader :MAX_CARD_LIMIT

  def top_up(amount)
    if @balance + amount < @MAX_CARD_LIMIT
      @balance += amount
    else
      p "Maximum balance exceeded of £#{@MAX_CARD_LIMIT}"
    end
  end

  def deduct(fare)
    return @balance -= fare
  end

  def in_journey?
    @card_in_use
  end

  def touch_in
    raise "Insufficient funds must have minimum £1 balance" if @balance < 1
    @card_in_use = true
  end

  def touch_out
    @card_in_use = false
  end

end
