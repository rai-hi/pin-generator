# frozen_string_literal: true

require 'test_helper'
require 'pin'
require 'pin_validator_test'
require 'current_year_validator'

class CurrentYearValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @object = @validator = CurrentYearValidator.new(
      pin: :pin, customer: :customer, bank_account: :ba
    )
  end

  def test_is_valid_if_not_current_year
    validator = CurrentYearValidator.new(
      pin: Pin.new('2015'), customer: :customer, bank_account: :account
    )
    assert validator.valid?
  end

  def test_is_invalid_if_current_year
    year_pin_value = Date.today.year.to_s
    pin = Pin.new(year_pin_value)

    validator = CurrentYearValidator.new(
      pin: pin, customer: :customer, bank_account: :account
    )
    refute validator.valid?
  end
end
