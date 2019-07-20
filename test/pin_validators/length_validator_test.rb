# frozen_string_literal: true

require 'test_helper'
require 'pin_validator_test'
require 'length_validator'

class LengthValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @object = @validator = LengthValidator.new(
      pin: :pin, customer: :customer, bank_account: :account
    )
  end

  def test_valid_for_correct_length
    valid_pin = Minitest::Mock.new
    valid_pin.expect :length, 4
    validator = LengthValidator.new(
      pin: valid_pin, bank_account: nil, customer: nil
    )
    assert validator.valid?
  end

  def test_invalid_for_correct_length
    invalid_pin = Minitest::Mock.new
    invalid_pin.expect :length, 5
    validator = LengthValidator.new(
      pin: invalid_pin, bank_account: nil, customer: nil
    )
    refute validator.valid?
  end
end
