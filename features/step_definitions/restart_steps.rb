include TicTacToeCapybaraTest

When(/^I press 'Restart Game'$/) do
  page.find('.restart-game-btn').click
end

Then(/^I should see 'Select game options to begin'$/) do
  page.current_path.should == '/'
end