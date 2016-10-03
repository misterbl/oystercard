class Oystercard
LIMIT = 90
attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    raise "Cannot top up the amount as your limit has been reached!!" if amount + @balance > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
