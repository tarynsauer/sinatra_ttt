Feature: Game
  In order play a complete game
  As a game player
  I want to see the outcome of the game

  Scenario: A game finishes in a win
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    And I press the 1B cell button
    And I press the 2A cell button
    And I press the 2B cell button
    And I press the 3A cell button
    Then I should see 'wins'

  Scenario: A game finishes in a tie
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'
    And I press the 1A cell button
    And I press the 1B cell button
    And I press the 1C cell button
    And I press the 3A cell button
    And I press the 3B cell button
    And I press the 3C cell button
    And I press the 2C cell button
    And I press the 2B cell button
    And I press the 2A cell button
    Then I should see 'tie'