# frozen_string_literal: true

require 'account_number_contents_validator'
require 'consecutive_sequence_validator'
require 'length_validator'
require 'repeated_character_validator'
require 'reused_pin_validator'
require 'sort_code_contents_validator'
require 'current_year_validator'

module PinValidators
  def self.all
    [
      AccountNumberContentsValidator,
      ConsecutiveSequenceValidator,
      LengthValidator,
      RepeatedCharacterValidator,
      ReusedPinValidator,
      SortCodeContentsValidator,
      CurrentYearValidator
    ]
  end
end
