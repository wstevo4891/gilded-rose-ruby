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

  def add_quality
    @quality += 1
  end

  def subtract_quality
    @quality -= 1
  end

  def negate_quality
    @quality -= @quality
  end

  def qual_under_fifty?
    @quality < 50
  end
end
