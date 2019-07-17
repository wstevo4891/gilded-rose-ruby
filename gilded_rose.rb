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
      if item.name != BRIE && item.name != BACKSTAGE
        if item.quality > 0
          if item.name != SULFURAS
            item.subtract_quality
          end
        end
      elsif item.quality < 50
        item.add_quality

        if item.name == BACKSTAGE
          if item.sell_in < 11
            if item.quality < 50
              item.add_quality
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.add_quality
            end
          end
        end
      end

      if item.name != SULFURAS
        item.subtract_sell_in
      end

      if item.sell_in < 0
        if item.name != BRIE
          if item.name != BACKSTAGE
            if item.quality > 0
              if item.name != SULFURAS
                item.subtract_quality
              end
            end
          else
            item.negate_quality
          end
        elsif item.quality < 50
          item.add_quality
        end
      end
    end
  end
end
