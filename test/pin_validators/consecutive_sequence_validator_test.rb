# frozen_string_literal: true

require 'test_helper'
require 'pin_validator_test'
require 'consecutive_sequence_validator'

class ConsecutiveSequenceValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @object = @validator = ConsecutiveSequenceValidator.new(
      pin: :pin,
      customer: :customer,
      bank_account: :account
    )
  end

  def test_valid_for_no_consecutive_characters
    valid_pin = Minitest::Mock.new
    valid_pin.expect :value, '1235'
    validator = ConsecutiveSequenceValidator.new(
      customer: :customer, bank_account: :account, pin: valid_pin
    )
    assert validator.valid?
  end

  def test_valid_for_no_consecutive_characters_2
    valid_pin = Minitest::Mock.new
    valid_pin.expect :value, '6123'
    validator = ConsecutiveSequenceValidator.new(
      customer: :customer, bank_account: :account, pin: valid_pin
    )
    assert validator.valid?
  end

  def test_invalid_for_consecutive_characters
    invalid_pin = Minitest::Mock.new
    invalid_pin.expect :value, '1234'
    validator = ConsecutiveSequenceValidator.new(
      customer: :customer, bank_account: :account, pin: invalid_pin
    )
    refute validator.valid?
  end
end
