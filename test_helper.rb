require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

def gilded_item(name, sell_in, quality)
  items = [Item.new(name, sell_in, quality)]
  GildedRose.new(items).call
  puts items.first.inspect
  items.first
end
