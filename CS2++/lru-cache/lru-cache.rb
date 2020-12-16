# LRU cache interview problem

# create Cache class with following attributes
# - max_size: will limit how many records are allowed
# - data: likely another object that will contain data AND timestamp of when it was last viewed

# required methods
# - to_h
# - write
# - read
# - delete
# - clear
# - count

class Record
  attr_reader :data, :last_used
end

class Cache
  attr_reader :max_size, :data

  def initialize(max_size:)
    @data = {}
    @max_size = max_size
  end

  def to_h
    puts data
  end
end



###
cache = Cache.new(max_size: 3)

cache.to_h
