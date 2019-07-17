# gilded_rose_spec.rb

require './item'
require './gilded_rose'
require 'test/spec'

describe GildedRose do

  describe '#call' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).call
      expect(items[0].name).to eq 'foo'
    end
  end

end
