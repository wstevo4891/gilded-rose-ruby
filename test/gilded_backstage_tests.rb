# test/gilded_backstage_tests.rb

require './test/test_helper'

##
# Test the GildedRose on Items with name:
# 'Backstage passes to a TAFKAL80ETC concert'
#
class GildedBackstageTests < GildedRoseTest
  def test_backstage_quality_zero
    puts __method__
    item = gilded_item('Backstage passes to a TAFKAL80ETC concert', 0, 0)

    assert_equal(0, item.quality)
  end

  def test_backstage_quality_under_fifty
    puts __method__
    item = gilded_item('Backstage passes to a TAFKAL80ETC concert', 0, 10)

    assert_equal(0, item.quality)
  end

  def test_backstage_quality_over_fifty
    puts __method__
    item = gilded_item('Backstage passes to a TAFKAL80ETC concert', 0, 55)

    assert_equal(0, item.quality)
  end

  def test_backstage_sell_in_zero_all
    puts __method__
    item = gilded_item('Backstage passes to a TAFKAL80ETC concert', 0, 0)

    assert_equal(-1, item.sell_in)
  end
end
