# frozen_string_literal: true

class LengthValidator
  VALID_LENGTH = 4

  attr_reader :pin

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
  end

  def valid?
    return true if @pin.length <= VALID_LENGTH
  end
end
