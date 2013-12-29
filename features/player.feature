Feature: Player
  In order to play a game
  As a human player
  I want to play against a computer player

  Background:
    Given I visit the homepage
    And I select 'Human' for 'Player one'
    And I select 'Computer' for 'Player two'
    And I press 'Start game!'

  Scenario: Easy computer player makes a move
    And I select 'Easy' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    Then I should see at least two markers on the board

  Scenario: Hard computer player makes a move
    And I select 'Hard' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    Then I should see at least two markers on the board