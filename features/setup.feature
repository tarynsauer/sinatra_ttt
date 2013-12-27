Feature: Setup
  In order to set up a new game
  As a game player
  I want to select the options for a new game

  Scenario: Set up a human vs. human game
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    When I press 'Start game!'
    Then I should see 'goes first'

  Scenario: Set difficulty level for a human vs. computer game
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Computer' for 'Player two'
    When I press 'Start game!'
    Then I should see 'Select difficulty level of computer player.'

  Scenario: Set up a human vs. computer game
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Computer' for 'Player two'
    And I press 'Start game!'
    And I select 'Hard' for 'Player two'
    When I press 'Start game!'
    Then I should see 'Player two: Hard computer'

  Scenario: Set up a 4 x 4 game board with two players
    Given I visit the index page
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I select '4' for 'Board size'
    When I press 'Start game!'
    Then I should see sixteen board cells