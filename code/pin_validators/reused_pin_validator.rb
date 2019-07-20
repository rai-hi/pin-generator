# frozen_string_literal: true

class ReusedPinValidator
  attr_reader :pin

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
    @bank_account = bank_account
  end

  def valid?
    return false if @bank_account.recent_pin_history.include? @pin

    true
  end
end
