# frozen_string_literal: true

class CurrentYearValidator
  attr_reader :pin

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
  end

  def valid?
    return false if @pin.value == Date.today.year.to_s

    true
  end
end
