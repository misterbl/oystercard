class Oyster
  attr_reader :balance, :limit

  MAXIMUM_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Amount exceeds limit" if amount + @balance > MAXIMUM_LIMIT
    @balance += amount
    return @balance
  end

  def touch_in
    raise "Insufficient balance to travel" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(2)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
