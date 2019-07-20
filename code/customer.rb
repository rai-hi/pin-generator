# frozen_string_literal: true

class Customer
  attr_reader :name, :dob

  def initialize(name:, dob:)
    @name = name
    @dob = dob
  end
end
