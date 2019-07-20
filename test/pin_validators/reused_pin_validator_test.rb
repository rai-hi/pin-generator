# frozen_string_literal: true

require 'test_helper'
require 'pin'
require 'bank_account'
require 'pin_validator_test'
require 'reused_pin_validator'

class ReusedPinValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @old_pins = [
      Pin.new('1234'),
      Pin.new('1235'),
      Pin.new('1236'),
      Pin.new('1237')
    ]
    @bank_account = BankAccount.new(pin_history: @old_pins, sort_code:'1', account_number: '1')
    @object = @validator = ReusedPinValidator.new(
      pin: :pin, customer: :customer, bank_account: @bank_account
    )
  end

  def test_valid_for_new_pin
    validator = ReusedPinValidator.new(
      pin: Pin.new('1239'),
      customer: :customer,
      bank_account: @bank_account
    )
    assert validator.valid?
  end

  def test_valid_for_early_reused_pins
    validator = ReusedPinValidator.new(
      pin: Pin.new('1234'),
      customer: :customer,
      bank_account: @bank_account
    )
    assert validator.valid?
  end

  def test_invalid_for_one_of_latest_three_pins
    validator = ReusedPinValidator.new(
      pin: Pin.new('1235'),
      customer: :customer,
      bank_account: @bank_account
    )
    refute validator.valid?
  end
end
