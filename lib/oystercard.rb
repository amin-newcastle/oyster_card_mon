class Oystercard

    def initialize
        @balance = 0
        @MAX_CARD_LIMIT = 90
    end

    attr_reader :balance, :MAX_CARD_LIMIT

    def top_up(amount)
        if @balance + amount < @MAX_CARD_LIMIT
            @balance += amount
        else
            p "Maximum balance exceeded of £#{@MAX_CARD_LIMIT}"
        end
    end

end
