class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      unless item.name.include? "Sulfuras"
        if item.name.include?("Aged Brie") || item.name.include?("Backstage passes")
          if item.quality < 50
            item.quality += 1
            if item.name.include?("Backstage passes") && item.quality < 50
              if item.sell_in < 11
                item.quality += 1
              elsif item.sell_in < 6
                item.quality += 2
              end
            end
          end
        else
          if item.quality > 0
            item.name.include?("Conjured") ? item.quality = [item.quality - 2, 0].max : item.quality -= 1
          end
        end
        
        item.sell_in -= 1
        
        if item.sell_in < 0
          if item.name.include? "Aged Brie"
            item.quality = [item.quality + 1, 50].min
          else
            if item.name.include? "Backstage passes"
              item.quality = 0
            else
              item.quality = [item.quality - 1, 0].max
            end
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
