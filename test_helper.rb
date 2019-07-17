# test_helper.rb

require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

# Parent Class for all Gilded Rose Tests
class GildedRoseTest < Test::Unit::TestCase
  def teardown
    puts ''
  end

  private

  def gilded_item(name, sell_in, quality)
    items = [Item.new(name, sell_in, quality)]
    GildedRose.new(items).call
    puts items.first.inspect
    items.first
  end
end
