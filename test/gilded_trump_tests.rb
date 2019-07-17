# test/gilded_trump_tests.rb

require 'minitest/autorun'
require 'minitest/trump'

class GildedTrumpTests < Minitest::Test
  def teardown
    puts ''
  end

  def test_golf_swing
    puts __method__
    skip 'Responsibility'
  # rescue ::Minitest::Skip => e
  #   assert_equal 'Golfing', e.result_label
  #   assert_equal 'GOLF', e.result_code
  end

  def test_sanity_failure
    puts __method__
    assert_equal 1, 2
  end

  def test_two_plus_two
    puts __method__
    assert_equal 5, 2 + 2
  end
end
