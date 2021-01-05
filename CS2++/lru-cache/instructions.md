# LRU Cache

An in memory cache implementation that expires the least recently used items, and limits cache size by a maximum number of items.

## API

A cache object can be instantiated in memory. It requires the max number of records as an argument:
```ruby
cache = Cache.new(max_size: 100)
```

An object may be written to a string cache key:
```ruby
cache.write("key", value)
```

That object may be retrieved by a key, or `nil` is returned if it is not found:
```ruby
cache.read("key")
```

A cached value may be deleted by key:
```ruby
cache.delete("key")
```

All values may be deleted:
```ruby
cache.clear
```

The number of records can be fetched at any time:
```ruby
cache.count
```


## Example

```
> cache = Cache.new(max_size: 3)
=> #<Cache:0x007fbe2b2ab8b8 @data={}, @max_size=3>

> cache.to_h
=> {}

> cache.write("key1", "val1")
=> "val1"

> cache.to_h
=> {"key1"=>"val1"}

> cache.write("key2", "val2")
=> "val2"

> cache.to_h
=> {"key1"=>"val1", "key2"=>"val2"}

> cache.write("key3", "val3")
=> "val3"

> cache.to_h
=> {"key1"=>"val1", "key2"=>"val2", "key3"=>"val3"}

> cache.write("key4", "val4")
=> "val4"

> cache.to_h
=> {"key2"=>"val2", "key3"=>"val3", "key4"=>"val4"}

> cache.read("key1")
=> nil

> cache.read("key2")
=> "val2"

> cache.to_h
=> {"key2"=>"val2", "key3"=>"val3", "key4"=>"val4"}

> cache.write("key5", "val5")
=> "val5"

> cache.write("key6", "val6")
=> "val6"

> cache.to_h
=> {"key2"=>"val2", "key5"=>"val5", "key6"=>"val6"}

> cache.count
=> 3

> cache.write("key5", "value5-overwrite")
=> "value5-overwrite"

> cache.read("key5")
=> "value5-overwrite"

> cache.clear
=> 3

> cache.to_h
=> {}
```
