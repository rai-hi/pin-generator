# frozen_string_literal: true

require 'test_helper'
require 'pin'
require 'bank_account'
require 'customer'
require 'pin_generator'
require 'pin_validators'

class PinGeneratorTest < MiniTest::Test
  def setup
    @bank_account = BankAccount.new(
      sort_code: '11-22-33',
      account_number: '1234567',
      pin_history: [
        Pin.new('9239'),
        Pin.new('1234'),
      ]
    )

    @customer = Customer.new(
      dob: Date.new,
      name: 'Test'
    )

    @validator_classes = PinValidators.all

    @generator = PinGenerator.new(
      bank_account: @bank_account,
      customer: @customer,
      validator_classes: @validator_classes
    )
  end

  def test_generate_method_returns_a_pin
    assert_equal Pin, @generator.generate.class
  end

  def test_generated_pin_is_valid_according_to_all_validators
    pin = @generator.generate

    all_validators_valid = @validator_classes.all? do |validator|
      validator.new(
        pin: pin, bank_account: @bank_account, customer: @customer
      ).valid?
    end

    assert all_validators_valid
  end
end
