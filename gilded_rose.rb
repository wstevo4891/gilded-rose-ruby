# gilded_rose.rb

# A something that updates item quality and sell_in
class GildedRose
  BRIE = 'Aged Brie'.freeze
  SULFURAS = 'Sulfuras, Hand of Ragnaros'.freeze
  BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert'.freeze

  def initialize(items)
    @items = items
  end

  def call
    update_quality
  end

  private

  def update_quality
    @items.each do |item|
      next if item.name == SULFURAS

      eval_name(item)
    end
  end

  def eval_name(item)
    case item.name
    when BRIE
      update_brie(item)
    when BACKSTAGE
      update_backstage(item)
    else
      update_anonymous(item)
    end
  end

  def update_brie(item)
    item.add_quality if item.quality < 50

    item.subtract_sell_in

    return unless item.sell_in.negative?

    item.add_quality if item.quality < 50
  end

  def update_backstage(item)
    if item.quality < 50
      if item.sell_in < 11
        item.quality += 2
      else
        item.add_quality
      end
    end

    item.subtract_sell_in

    return unless item.sell_in.negative?

    item.negate_quality
  end

  def update_anonymous(item)
    item.subtract_quality if item.quality.positive?

    item.subtract_sell_in

    return unless item.sell_in.negative?

    item.subtract_quality if item.quality.positive?
  end
end

##
# NOTES
#
# =====================
# BRIE
# =====================
# if item.name == BRIE
#   if item.quality < 50
#     item.add_quality
#   end
#
#   item.subtract_sell_in
#
#   next unless item.sell_in.negative?
#
#   if item.quality < 50
#     item.add_quality
#   end
# end

# =====================
# BACKSTAGE
# =====================
# if item.name == BACKSTAGE
#   if item.quality < 50
#     item.add_quality
#
#     if item.sell_in < 11
#       item.add_quality
#     end
#   end
#
#   item.subtract_sell_in
#
#   next unless item.sell_in.negative?
#
#   item.negate_quality
# end

# =====================
# SULFURAS
# =====================
# if item.name == SULFURAS
#   # Absolutely nothing happens!
# end

# =====================
# Foo
# =====================
# if item.name == 'Foo'
#   if item.quality.positive?
#     item.subtract_quality
#   end
#
#   item.subtract_sell_in
#
#   next unless item.sell_in.negative?
#
#   if item.quality.positive?
#     item.subtract_quality
#   end
# end
