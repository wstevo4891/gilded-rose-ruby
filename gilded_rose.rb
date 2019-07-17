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
            item.quality = item.quality - 1
          end
        end
      elsif item.quality < 50
        item.quality = item.quality + 1

        if item.name == BACKSTAGE
          if item.sell_in < 11
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end

      if item.name != SULFURAS
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < 0
        if item.name != BRIE
          if item.name != BACKSTAGE
            if item.quality > 0
              if item.name != SULFURAS
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        elsif item.quality < 50
          # item.add_quality
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
