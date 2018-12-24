Feature: Rock-Paper-Scissors.

Scenario: Human Name Validation
  Given a new match
  When the user enters an invalid name
  Then the user is prompted to reenter the name correctly
  When the user enters a valid name
  Then the name is validated
 
Scenario: Computer Name Validation
  Given a new match
  And the user is prompted to enter a computer name
  When the user submits an invalid name
  Then the user is prompted to reenter the name correctly
  When the user submits a valid name
  Then the name is validated

Scenario: Move Validation
  Given a new match
  When the player is prompted to enter a move
  Then they should be instructed to enter a valid move
  When they enter an invalid move
  Then they should be forced to try again
  When they enter the move "Quit"
  Then the match should terminate
  And the computer should be the winner by forfeit
  When they enter a valid move
  Then the move should be recorded

Scenario Outline: Expected Game Results
  Given a new match
  When the player move is <player_move>
  And the computer move is <computer_move>
  Then the result should be <result>

Examples:
  | human_move  |  computer_move  | result        |
  | rock        |  rock           | draw          |
  | paper       |  paper          | draw          |
  | scissors    |  scissors       | draw          |
  | rock        |  scissors       | player_win    |
  | paper       |  rock           | player_win    |
  | scissors    |  paper          | player_win    |
  | rock        |  paper          | computer_win  |
  | paper       |  scissors       | computer_win  |
  | scissors    |  rock           | computer_win  |

Scenario Outline: Expected Match Results
  Given a new match
  When <human_wins> == <int>
  And <computer_wins> == <int>
  Then the result is <match_result>

  Examples:
  | human_wins  |  computer_wins  | match_result    |
  | 7           |  6              | player_victory  |
  | 6           |  7              | computer_victory|




