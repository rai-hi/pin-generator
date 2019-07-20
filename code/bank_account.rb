# frozen_string_literal: true

class BankAccount
  attr_reader :sort_code, :account_number, :pin_history

  def initialize(sort_code:, account_number:, pin_history:)
    @sort_code = sort_code
    @account_number = account_number
    @pin_history = pin_history
  end

  def dehyphenated_sort_code
    @sort_code.gsub '-', ''
  end

  def recent_pin_history
    @pin_history.last(3)
  end
end
