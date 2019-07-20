# frozen_string_literal: true

class AccountNumberContentsValidator
  attr_reader :pin

  def initialize(pin:, bank_account:, customer:)
    @pin = pin
    @bank_account = bank_account
  end

  def valid?
    account_number = @bank_account.account_number
    return false if account_number.include? pin.value

    true
  end
end
