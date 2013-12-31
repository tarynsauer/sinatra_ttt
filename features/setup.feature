Feature: Setup
  In order to set up a new game
  As a game player
  I want to select the options for a new game

  Background:
    Given I visit the homepage
    And I select 'Human' for 'Player one'

  Scenario: Set up a human vs. human game
    And I select 'Human' for 'Player two'
    When I press 'Start game!'
    Then I should see 'goes first'

  Scenario: Set difficulty level for a human vs. computer game
    And I select 'Computer' for 'Player two'
    When I press 'Start game!'
    Then I should see the difficulty page.

  Scenario: Set up a human vs. computer game
    And I select 'Computer' for 'Player two'
    And I press 'Start game!'
    And I select 'Hard' for 'Player two'
    When I press 'Start game!'
    Then I should see 'Player two: Hard computer'

  Scenario: Set up a 4 x 4 game board with two players
    And I select 'Human' for 'Player two'
    And I select '4' for 'Board size'
    When I press 'Start game!'
    Then I should see sixteen board cells