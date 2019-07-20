# frozen_string_literal: true

require 'test_helper'
require 'pin'

class PinTest < MiniTest::Test
  def test_pin_can_be_instantiated_with_4_digit_string
    assert Pin.new '1234'
  end

  def test_provided_value_can_be_read
    pin = Pin.new '1234'
    assert_equal '1234', pin.value
  end

  def test_value_must_be_4_characters
    assert_raises StandardError do
      Pin.new '123'
    end
  end

  def test_has_length_method
    assert_equal 4, Pin.new('1234').length
  end

  def test_pin_must_be_numeric
    assert_raises StandardError do
      Pin.new '123a'
    end
  end

  def test_two_pins_with_same_value_are_equal
    assert_equal Pin.new('1234'), Pin.new('1234')
  end
  
  def test_two_pins_with_diff_value_arent_equal
    refute_equal Pin.new('2234'), Pin.new('1234')
  end
end
