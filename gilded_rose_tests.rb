# gilded_rose_tests.rb

require File.join(File.dirname(__FILE__), 'test_helper')

class GildedRoseTests < Test::Unit::TestCase
  def teardown
    puts ''
  end

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
