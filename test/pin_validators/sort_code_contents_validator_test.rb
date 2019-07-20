# frozen_string_literal: true

require 'test_helper'
require 'pin'
require 'bank_account'
require 'pin_validator_test'
require 'sort_code_contents_validator'

class SortCodeContentsValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @bank_account = BankAccount.new(
      pin_history: :old_pins, sort_code: '34-56-78', account_number: '1'
    )

    @object = @validator = SortCodeContentsValidator.new(
      pin: :pin, customer: :customer, bank_account: @bank_account
    )
  end

  def test_valid_for_pin_not_in_sort_code
    validator = SortCodeContentsValidator.new(
      pin: Pin.new('1234'),
      customer: :customer,
      bank_account: @bank_account
    )
    assert validator.valid?
  end

  def test_invalid_for_pin_in_sort_code_1
    validator = SortCodeContentsValidator.new(
      pin: Pin.new('3456'),
      customer: :customer,
      bank_account: @bank_account
    )
    refute validator.valid?
  end

  def test_invalid_for_pin_in_sort_code_2
    validator = SortCodeContentsValidator.new(
      pin: Pin.new('5678'),
      customer: :customer,
      bank_account: @bank_account
    )
    refute validator.valid?
  end
end
