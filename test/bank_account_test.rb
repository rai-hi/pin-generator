# frozen_string_literal: true

require 'test_helper'
require 'bank_account'

class BankAccountTest < MiniTest::Test
  def setup
    @sort_code = '10-30-30'
    @account_number = '11316768'
    @pin_history = %i[pin1 pin2 pin3 pin4]
    @account = BankAccount.new sort_code: @sort_code, account_number: @account_number, pin_history: @pin_history
  end

  def test_returns_sort_code
    assert_equal @sort_code, @account.sort_code
  end

  def test_returns_account_number
    assert_equal @account_number, @account.account_number
  end

  def test_returns_pin_history
    assert_equal @pin_history, @account.pin_history
  end

  def test_has_recent_pin_history
    assert_equal %i[pin2 pin3 pin4], @account.recent_pin_history
  end

  def test_returns_sort_code_without_hyphens
    assert_equal '103030', @account.dehyphenated_sort_code
  end
end
