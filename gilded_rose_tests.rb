# gilded_rose_tests.rb

require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class GildedRoseTests < Test::Unit::TestCase
  def teardown
    puts ''
  end

  def test_brie_quality_zero
    puts __method__
    item = gilded_item('Aged Brie', 0, 0)

    assert_equal 2, item.quality
  end

  def test_brie_quality_over_fifty
    puts __method__
    item = gilded_item('Aged Brie', 0, 55)

    assert_equal 55, item.quality
  end

  def test_brie_sell_in_zero
    puts __method__
    item = gilded_item('Aged Brie', 0, 0)

    assert_equal(-1, item.sell_in)
  end

  def test_brie_sell_in_twelve
    puts __method__
    item = gilded_item('Aged Brie', 12, 0)

    assert_equal(11, item.sell_in)
  end

  private

  def gilded_item(name, sell_in, quality)
    items = [Item.new(name, sell_in, quality)]
    GildedRose.new(items).call
    puts items.first.inspect
    items.first
  end
end
