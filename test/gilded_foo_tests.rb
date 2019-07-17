# gilded_foo_tests.rb

require './test/test_helper'

##
# Test the GildedRose on Items with a name that
# is not one of the three constants.
# name: 'Foo'
#
class GildedFooTests < GildedRoseTest
  def test_foo_quality_zero
    puts __method__
    item = gilded_item('Foo', 0, 0)

    assert_equal 0, item.quality
  end

  def test_foo_quality_positive
    puts __method__
    item = gilded_item('Foo', 0, 5)

    assert_equal 3, item.quality
  end

  def test_foo_sell_in_zero
    puts __method__
    item = gilded_item('Foo', 0, 0)

    assert_equal(-1, item.sell_in)
  end

  def test_foo_sell_in_positive
    puts __method__
    item = gilded_item('Foo', 12, 0)

    assert_equal(11, item.sell_in)
  end
end
