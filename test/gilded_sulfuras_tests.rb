# gilded_sulfuras_tests.rb

require './test/test_helper'

##
# Test the GildedRose on Items with name:
# 'Sulfuras, Hand of Ragnaros'
#
class GildedSulfurasTests < GildedRoseTest
  def test_sulfuras_quality_zero
    puts __method__
    item = gilded_item('Sulfuras, Hand of Ragnaros', 0, 0)

    assert_equal(0, item.quality)
  end

  def test_sulfuras_quality_positive
    puts __method__
    item = gilded_item('Sulfuras, Hand of Ragnaros', 0, 5)

    assert_equal(5, item.quality)
  end

  def test_sulfuras_sell_in_zero
    puts __method__
    item = gilded_item('Sulfuras, Hand of Ragnaros', 0, 0)

    assert_equal(0, item.sell_in)
  end

  def test_sulfuras_sell_in_twelve
    puts __method__
    item = gilded_item('Sulfuras, Hand of Ragnaros', 12, 0)

    assert_equal(12, item.sell_in)
  end

  def test_sulfuras_sell_in_negative
    puts __method__
    item = gilded_item('Sulfuras, Hand of Ragnaros', -10, 0)

    assert_equal(-10, item.sell_in)
  end
end
