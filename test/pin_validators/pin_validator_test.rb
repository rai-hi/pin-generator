# frozen_string_literal: true

module PinValidatorTest
  def test_has_a_valid_method
    assert @object.respond_to? :valid?
  end

  def test_can_be_initialized_with_expected_values
    assert @object.class.new pin: :pin, customer: :customer, bank_account: :bank_account
  end
end
