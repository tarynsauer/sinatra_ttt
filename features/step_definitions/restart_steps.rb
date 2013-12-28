include TicTacToeCapybaraTest

When(/^I press 'Restart Game'$/) do
  click_button "Restart Game"
end

Then(/^I should see 'Select game options to begin'$/) do
  expect(page).to have_content "Select game options to begin"
end