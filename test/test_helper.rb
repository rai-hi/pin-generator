# frozen_string_literal: true

require 'minitest/autorun'

# Add all subfolders to the load path
Dir['**/'].each do |code_dir|
  $LOAD_PATH << code_dir
end
