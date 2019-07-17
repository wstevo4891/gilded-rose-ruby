# gilded_brie_tests.rb

require File.join(File.dirname(__FILE__), 'test_helper')

##
# Test the GildedRose on Items with name: 'Aged Brie'
#
class GildedBrieTests < GildedRoseTest
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

  def test_brie_sell_in_over_eleven
    puts __method__
    item = gilded_item('Aged Brie', 12, 0)

    assert_equal(11, item.sell_in)
  end
end
