# frozen_string_literal: true

class ConsecutiveSequenceValidator
  attr_reader :pin, :customer, :bank_account

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
    @bank_account = bank_account
    @customer = customer
  end

  def valid?
    return false if consecutive_values?(@pin.value)

    true
  end

  private

  def consecutive_values?(string)
    numbers = string.split('').map { |char| Integer(char) }

    prev_number = numbers[0]

    numbers[1..-1].each do |number|
      return false if number != prev_number + 1

      prev_number = number
    end

    true
  end
end
