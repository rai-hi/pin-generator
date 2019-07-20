# frozen_string_literal: true

guard :minitest do
  # Watch test files
  watch(%r{^test/(.*)\/?(.*)_test\.rb$})

  # Watch code files
  watch(%r{^code/(.*/)?([^/]+)\.rb$}) do |m|
    "test/#{m[1]}#{m[2]}_test.rb"
  end
end
