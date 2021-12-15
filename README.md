# Battleship

This is a playable game of Battleship that runs in a REPL interface. The game will allow a single human player to play against a (simplistic) computer player. The project was completed by Austin Moore and Greg Flahtery as part of the Turing 2111 BE Module 1 pair project requirement. More information about the project can be found [here](https://backend.turing.edu/module1/projects/battleship/index)

## Evaluation Rubric

To pass this class, partners will need to score 2.5/4 possible points. The grading rubric is weighted from "Exceptional" with a score of 4, to "Well Below Expectations" with a score of 1. Scores are assigned on the following categories:

* Functionality
* Object Oriented Programming
* Test Driven Development
* Version Control

More information on evaluation criteria can be found [here](https://backend.turing.edu/module1/projects/battleship/rubric)

## Approach
[Iteration 1](https://backend.turing.edu/module1/projects/battleship/iteration_1)
Iteration 1 contained a well defined interaction pattern with little room for interpretation. Our ship's tests and object meet all requirements as defined, with no method containing more than 1 line of code. The same can be said of our cell files. We noticed that in our render method there is an opportunity to improve user empathy by replacing the instance variable @ship and the .nil? method with a helper method, as when these are called in the conditional it creates a double negative that is disruptive to understanding. However, no helper method was defined in the interaction pattern and we chose not to add it in case it would fail our instructor's test harness.

[Iteration 2](https://backend.turing.edu/module1/projects/battleship/iteration_2)
Iteration 2 was our first opportunity to choose what we thought would be the best process from a variety of seemingly feasible choices. The interaction pattern made test development as straightforward as iteration 1, but how we satisfied those tests seemed almost open to interpretation.

We ultimately decided that we wanted to challenge ourself on this project, with our eyes on creating a dynamic board in iteration 4 capable of responding to user defined dimensions. Instead of manually creating each cell instance in the Board class's initialize method, we used an enumerable that would generate a coordinate "x" amount of times, for a "y" number of iterations and manually replaced "x" with an array from A to D and "y" with 4 to default to a 4x4 board that would satisfy our interaction pattern.

Accepting this challenge early put us in a design mindset that carried over to our valid_placement? method. We wanted to create a scalable method for any size board, so we spent a lot of time talking about edge cases. Our planning resulted in this flowchart that we guided our coding off of.

![Valid_Method? Flowchart](/valid_placement (1).pdf "Valid_Method? Flowchart")

## Experience Gained
We will highlight the problem solving we accomplished

## Expanding The Game
We will enter our approach to anything we did not complete here
