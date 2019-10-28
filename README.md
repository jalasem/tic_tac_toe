This is the third project of the Main Ruby curriculum at [Microverse](https://www.microverse.org/) - @microverseinc

* The objective is to build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.
* The project was completed using Ruby language.

-   Original project specification at [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)
-   Tic-Tac-Toe [From Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe) for more details about Tic-Tac-Toe.

## 1. Usage Instructions

- Clone the repo and run the app.
```
$ git clone git@github.com:jalasem/tic_tac_toe.git
$ cd  Tic_Tac_Toe
$ ruby bin/main.rb
```
## 2. Specifications

- Rules of the game.

1. The game accepts only integers from 1 to 9.
2. It starts on player X's turn.
```
=========TIC-TAC-TOE=========

Welcome to the TIC-TAC-TOE game!

Players enter their name.

The first player is 'Player X'

Choose numbers from 1 to 9 to select desired cell.

No duplicate numbers are allowed

-------------
|   |   |   |
-------------
|   |   |   |
-------------
|   |   |   |
-------------

Player X is the next to play! Make your move.
```
3. After player X pick his number, it's player O turn.
```
-------------
| X |   |   |
-------------
|   |   |   |
-------------
|   |   |   |
-------------

Player O is the next to play! Make your move.
```
4. The game ends when either someone wins...

```
| X | O | O |
-------------
|   | X |   |
-------------
|   |   | X |
-------------

Player X won
==== GAME END ====
```
*Keep alternating moves until one of the players has drawn a row of three symbols.*

or it's draw.

```
-------------
| X | O | X |
-------------
| X | X | O |
-------------
| O | X | O |
-------------

It's a draw
==== GAME END ====

#### Authors

-   [@jalasem](https://github.com/jalasem/)
-   [@damiecode](https://github.com/damiecode/)