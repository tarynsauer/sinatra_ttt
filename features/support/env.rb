require File.join(File.expand_path(File.dirname(__FILE__)),'../../app')

require "Capybara"
require "Capybara/cucumber"
require "rspec"

module TicTacToeCapybaraTest
  Capybara.app = TicTacToe
  include RSpec::Matchers
  include Capybara::DSL
end