include TicTacToeCapybaraTest

Given(/^I press the (\d+)A cell button$/) do |arg1|
  click_button "#{arg1}A"
end

Then(/^I should see a marker in the (\d+)A cell$/) do |arg1|
  expect(page).to have_css('#board button[value="1A"]', text: (/(X|O)/))
end

Given(/^I press the (\d+)B cell button$/) do |arg1|
  click_button "#{arg1}B"
end

Then(/^I should see different markers in the (\d+)A and (\d+)B cells$/) do |arg1, arg2|
  expect(page.all("#board button", text: (/[XO]/)).count.should eql(2))
end

Then(/^cell (\d+)B should not have a marker$/) do |arg1|
  page.should have_no_selector("#board button[value='#{arg1}B']")
end