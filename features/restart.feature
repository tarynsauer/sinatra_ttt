Feature: Restart
  In order to set up a new game
  As a game player
  I want to go back to the homepage

  Scenario: Restart game from play page
    Given I visit the homepage
    And I select 'Human' for 'Player one'
    And I select 'Human' for 'Player two'
    And I press 'Start game!'
    When I press 'Restart Game'
    Then I should see 'Select game options to begin'