# frozen_string_literal: true

class Pin
  attr_reader :value

  def initialize(value)
    raise StandardError unless numeric? value
    raise StandardError unless correct_length? value

    @value = value
  end

  def length
    value.size
  end

  def ==(other)
    return true if other.value == value
  end

  private

  def characters(value)
    value.split ''
  end

  def correct_length?(value)
    value.size == 4
  end

  def numeric?(value)
    characters(value).all? do |character|
      character_is_numeric? character
    end
  end

  def character_is_numeric?(character)
    true if Integer(character)
  end
end
