# frozen_string_literal: true

require 'test_helper'
require 'pin_validator_test'
require 'repeated_character_validator'

class RepeatedCharacterValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @object = @validator = RepeatedCharacterValidator.new(
      pin: :pin, bank_account: :account, customer: :customer
    )
  end

  def test_valid_for_non_repeated_characters
    valid_pin = Minitest::Mock.new
    valid_pin.expect :value, '1234'

    validator = RepeatedCharacterValidator.new(
      pin: valid_pin,
      bank_account: :account,
      customer: :customer
    )
    assert validator.valid?
  end

  def test_valid_for_two_repeated_characters
    valid_pin = Minitest::Mock.new
    valid_pin.expect :value, '1224'
    validator = RepeatedCharacterValidator.new(
      pin: valid_pin,
      bank_account: :account,
      customer: :customer
    )
    assert validator.valid?
  end

  def test_invalid_for_more_than_two_repeated_characters
    invalid_pin = Minitest::Mock.new
    invalid_pin.expect :value, '1113'
    validator = RepeatedCharacterValidator.new(
      pin: invalid_pin,
      bank_account: :account,
      customer: :customer
    )
    refute validator.valid?
  end
end
