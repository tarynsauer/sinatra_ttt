include TicTacToeCapybaraTest

Given(/^I select 'Easy' for 'Player two'$/) do
  choose "easy-level-2"
end

Then(/^I should see at least two markers on the board$/) do
  page.all("#board button", text: (/[XO]/)).count >= 2
end