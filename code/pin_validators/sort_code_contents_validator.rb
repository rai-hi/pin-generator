# frozen_string_literal: true

class SortCodeContentsValidator
  attr_reader :pin

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
    @bank_account = bank_account
  end

  def valid?
    sort_code = @bank_account.dehyphenated_sort_code
    return false if sort_code.include? pin.value

    true
  end
end
