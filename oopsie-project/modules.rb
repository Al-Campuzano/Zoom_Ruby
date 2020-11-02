# Variety is the spice of life! Create 3 modules to mix n’ match and further evolve your creatures!  Each module must have a minimum of:

# 2 methods

module AcceptsBribes
  def offer_bribe
    if self.flip_coin == "heads"
      puts "Give me fifty bucks and I'll do it."
    else
      puts "How dare you insult me like this? I have principles!"
    end
  end

  def flip_coin
    if rand(2) == 1
      return "heads"
    else
      return "tails"
    end
  end
end

module GrowsSpices
  @time = Time.now
  def harvest
    if @time.month.between?(9,11)
      puts "Let's get to harvesting!"
    else
      puts "The crops are not ready yet."
    end 
  end

  def plant(spice="cumin")
    if @time.month.between?(4,6)
      puts "It's time to plant some #{spice}!"
    else
      puts "Now is not a good time to plant #{spice}."
    end
  end
end
