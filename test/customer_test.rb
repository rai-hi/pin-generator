# frozen_string_literal: true

require 'test_helper'
require 'customer'

class CustomerTest < MiniTest::Test
  def setup
    @name = 'Test'
    @dob = Date.new
    @customer = Customer.new(name: @name, dob: @dob)
  end

  def test_returns_name
    assert_equal @name, @customer.name
  end

  def test_returns_dob
    assert_equal @dob, @customer.dob
  end
end
