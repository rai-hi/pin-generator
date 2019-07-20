# frozen_string_literal: true

class RepeatedCharacterValidator
  attr_reader :pin

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
  end

  def valid?
    return false if too_many_repeated_characters?(@pin.value)

    true
  end

  private

  def too_many_repeated_characters?(string)
    three_repeated_char_regex = /(.)\1{2,}/
    string.match?(three_repeated_char_regex)
  end
end
