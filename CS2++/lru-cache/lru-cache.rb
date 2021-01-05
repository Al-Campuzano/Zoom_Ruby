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
  attr_reader :key, :data, :last_used

  def initialize(key, val)
    @key = key
    @data = val
    @last_used = Time.now
  end

  def update
    @last_used = Time.now
  end
end

class Cache
  attr_reader :max_size, :data

  def initialize(max_size:)
    @data = {}
    @max_size = max_size
  end

  def to_h
    data_hash = data.map do |k,v|
      [k, v.data]
    end.to_h
    p data_hash
  end

  def write(key, val)
    if (self.num_records < max_size)
      self.add_record(key,val)
    else
      self.remove_lru
      self.add_record(key, val)
    end
  end

  def delete(key)
    data.delete(key)
  end

  def read(key)
    return nil unless data[key]
    data[key].update
    puts data[key].data
  end

  def count
    puts self.num_records
  end

  private
    def num_records
      data.size
    end

    def add_record(key, val)
      record = Record.new(key, val)
      data[key] = record
    end

    def remove_lru
      oldest_record = data.values[0]
      data.each do |k,v|
        if v.last_used < oldest_record.last_used
          oldest_record = data[k]
        end
      end
      self.delete(oldest_record.key)
    end
end



###
cache = Cache.new(max_size: 3)
p cache
cache.to_h

cache.write("key1", "val1")
cache.to_h
cache.count
cache.write("key2", "val2")
cache.to_h
cache.count
cache.write("key3", "val3")
cache.to_h
cache.count
cache.write("key4", "val4")
cache.to_h
cache.count

# cache.delete("key3")
# cache.to_h
# cache.count

cache.read("key1")
cache.read("key2")

cache.to_h

cache.write("key5", "val5")
cache.write("key6", "val6")
cache.to_h
cache.count
p cache
