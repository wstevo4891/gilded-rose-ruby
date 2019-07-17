# gilded_rose.rb

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

      # if item.name == BRIE
      #   if item.quality < 50
      #     item.add_quality
      #   end

      #   item.subtract_sell_in

      #   next unless item.sell_in.negative?

      #   if item.quality < 50
      #     item.add_quality
      #   end
      # end

      # if item.name == BACKSTAGE
      #   if item.quality < 50
      #     item.add_quality
      #     if item.sell_in < 11 && item.quality < 50
      #       item.add_quality
      #     end
      #   end

      #   item.subtract_sell_in

      #   next unless item.sell_in.negative?

      #   item.negate_quality
      # end

      # if item.name == SULFURAS
      #   # Absolutely nothing happens!
      # end

      # if item.name == 'Foo'
      #   if item.quality.positive?
      #     item.subtract_quality
      #   end

      #   item.subtract_sell_in

      #   next unless item.sell_in.negative?

      #   if item.quality.positive?
      #     item.subtract_quality
      #   end
      # end

      if item.name != BRIE && item.name != BACKSTAGE
        if item.quality.positive?
          item.subtract_quality if item.name != SULFURAS
        end
      elsif item.quality < 50
        item.add_quality

        if item.name == BACKSTAGE
          if item.sell_in < 11 && item.quality < 50
            item.add_quality
          end
        end
      end

      item.subtract_sell_in if item.name != SULFURAS

      next unless item.sell_in.negative?

      if item.name != BRIE
        if item.name == BACKSTAGE
          item.negate_quality
        elsif item.quality.positive? && item.name != SULFURAS
          item.subtract_quality
        end
      elsif item.quality < 50
        item.add_quality
      end

    end
  end
end
