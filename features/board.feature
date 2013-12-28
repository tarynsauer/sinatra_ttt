Feature: Board
  In order to play a game
  As a game player
  I want to make moves on the board

  Scenario: Add a marker to the board
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    Then I should see a marker in the 1A cell

  Scenario: Add two different markers to the board
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    And I press the 1B cell button
    Then I should see different markers in the 1A and 1B cells

  Scenario: Disable board after win
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    And I press the 1B cell button
    And I press the 2A cell button
    And I press the 2B cell button
    And I press the 3A cell button
    Then cell 3B should not have a marker