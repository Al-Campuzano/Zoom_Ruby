class Product
  include Comparable
  attr_reader :title, :popularity, :price
  def initialize(title: "N/A", popularity: -1, price: -1)
    @title = title
    @popularity = popularity.to_i
    @price = price.to_i
  end

  def to_s
    title
  end

  def <=>(other)
    if self.popularity < other.popularity
      return 1
    elsif self.popularity == other.popularity
      return self.price <=> other.price
    else
      return -1
    end
  end
end

module ProductArrayBuilder
  def self.build_products_array(string_arr)
    products = []
    string_arr.each do |line|
      line_arr = line.split(",")
      title, popularity, price = *line_arr
      products << Product.new(title: title, popularity: popularity, price: price)
    end
    products
  end
end

input_array = [
      "Selfie Stick,98,29",
      "iPhone Case,90,15",
      "Fire TV Stick,48,49",
      "Wyze Cam,48,25",
      "Water Filter,56,49",
      "Blue Light Blocking Glasses,90,16",
      "Ice Maker,47,119",
      "Video Doorbell,47,199",
      "AA Batteries,64,12",
      "Disinfecting Wipes,37,12",
      "Baseball Cards,73,16",
      "Winter Gloves,32,112",
      "Microphone,44,22",
      "Pet Kennel,5,24",
      "Jenga Classic Game,100,7",
      "Ink Cartridges,88,45",
      "Instant Pot,98,59",
      "Hoze Nozzle,74,26",
      "Gift Card,45,25",
      "Keyboard,82,19"
]

products_arr = ProductArrayBuilder.build_products_array(input_array)
puts products_arr.sort
