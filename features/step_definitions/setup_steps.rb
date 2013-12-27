include TicTacToeCapybaraTest

Given(/^I visit the index page$/) do
  visit "/"
end

Given(/^I select 'Human' for 'Player one'$/) do
  choose "player-one-human"
end

Given(/^I select 'Human' for 'Player two'$/) do
  choose "player-two-human"
end

When(/^I press 'Start game!'$/) do
  click_button "Start game!"
end

Then(/^I should see 'goes first'$/) do
  expect(page).to have_content "goes first"
end

Given(/^I select 'Computer' for 'Player two'$/) do
  choose "player-two-computer"
end

Then(/^I should see 'Select difficulty level of computer player\.'$/) do
  expect(page).to have_content "Select difficulty level of computer player."
end

Given(/^I select 'Computer' for 'Player one'$/) do
  choose "player-one-computer"
end

Given(/^I select 'Hard' for 'Player one'$/) do
  choose "hard-level-1"
end

Given(/^I select 'Hard' for 'Player two'$/) do
  choose "hard-level-2"
end

Then(/^I should see 'Player two: Hard computer'$/) do
  expect(page).to have_content "Player two: Hard computer"
end

Given(/^I select '(\d+)' for 'Board size'$/) do |arg1|
  select('4', :from => 'board-size')
end

Then(/^I should see sixteen board cells$/) do
  expect(page.all("#board button").count.should eql(16))
end