# frozen_string_literal: true

require 'test_helper'
require 'pin'
require 'bank_account'
require 'pin_validator_test'
require 'account_number_contents_validator'

class AccountNumberContentsValidatorTest < MiniTest::Test
  include PinValidatorTest

  def setup
    @bank_account = BankAccount.new(
      pin_history: :old_pins, sort_code: '34-56-78', account_number: '123456789'
    )

    @object = @validator = AccountNumberContentsValidator.new(
      pin: :pin, customer: :customer, bank_account: @bank_account
    )
  end

  def test_valid_for_pin_not_in_account_number
    validator = AccountNumberContentsValidator.new(
      pin: Pin.new('1334'),
      customer: :customer,
      bank_account: @bank_account
    )
    assert validator.valid?
  end

  def test_invalid_for_pin_in_account_number_1
    validator = AccountNumberContentsValidator.new(
      pin: Pin.new('3456'),
      customer: :customer,
      bank_account: @bank_account
    )
    refute validator.valid?
  end

  def test_invalid_for_pin_in_account_number_2
    validator = AccountNumberContentsValidator.new(
      pin: Pin.new('5678'),
      customer: :customer,
      bank_account: @bank_account
    )
    refute validator.valid?
  end
end
