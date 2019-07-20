# frozen_string_literal: true

class PinGenerator
  PIN_LENGTH = 4

  def initialize(bank_account:, customer:, validator_classes: [])
    @validator_classes = validator_classes
    @bank_account = bank_account
    @customer = customer
  end

  def generate
    pin = random_pin
    pin = random_pin until valid?(pin)
    pin
  end

  private

  def random_pin
    Pin.new random_pin_value
  end

  def random_pin_value
    PIN_LENGTH.times.map { rand(10) }.join('')
  end

  def valid?(pin)
    @validator_classes.all? do |validator_class|
      valid_according_to_validator_class?(validator_class, pin)
    end
  end

  def valid_according_to_validator_class?(validator_class, pin)
    validator = validator(validator_class, pin)
    validator.valid?
  end

  def validator(validator_class, pin)
    validator_class.new(
      bank_account: @bank_account,
      customer: @customer,
      pin: pin
    )
  end
end
