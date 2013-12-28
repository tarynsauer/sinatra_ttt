include TicTacToeCapybaraTest

Then(/^I should see 'wins'$/) do
  expect(page).to have_content "wins"
end

Given(/^I press the (\d+)C cell button$/) do |arg1|
  click_button "#{arg1}C"
end

Then(/^I should see 'tie'$/) do
  expect(page).to have_content "tie"
end
