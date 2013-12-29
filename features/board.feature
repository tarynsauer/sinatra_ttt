Feature: Board
  In order to play a game
  As a game player
  I want to make moves on the board

  Background:
    Given I visit the homepage
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'

  Scenario: Add a marker to the board
    And I press the 1A cell button
    Then I should see a marker in the 1A cell

  Scenario: Add two different markers to the board
    And I press the 1A cell button
    And I press the 1B cell button
    Then I should see different markers in the 1A and 1B cells

  Scenario: Disable board after win
    And I press the 1A cell button
    And I press the 1B cell button
    And I press the 2A cell button
    And I press the 2B cell button
    And I press the 3A cell button
    Then cell 3B should not have a marker