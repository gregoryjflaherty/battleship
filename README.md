# Battleship

This is a playable game of Battleship that runs in a REPL interface. The game will allow a single human player to play against a (simplistic) computer player. The project was completed by Austin Moore and Greg Flaherty as part of the Turing 2111 BE Module 1 pair project requirement. More information about the project can be found [here](https://backend.turing.edu/module1/projects/battleship/index)

## Evaluation Rubric

To pass this class, partners will need to score 2.5/4 possible points. The grading rubric is weighted from "Exceptional" with a score of 4, to "Well Below Expectations" with a score of 1. Scores are assigned on the following categories:

* Functionality
* Object Oriented Programming
* Test Driven Development
* Version Control

More information on evaluation criteria can be found [here](https://backend.turing.edu/module1/projects/battleship/rubric)

## Approach
### [Iteration 1](https://backend.turing.edu/module1/projects/battleship/iteration_1)
Iteration 1 contained a well defined interaction pattern with little room for interpretation. Our ship's tests and object meet all requirements as defined, with no method containing more than 1 line of code. The same can be said of our cell files. We noticed that in our render method there is an opportunity to improve user empathy by replacing the instance variable @ship and the .nil? method with a helper method, as when these are called in the conditional it creates a double negative that is disruptive to understanding. However, no helper method was defined in the interaction pattern and we chose not to add it in case it would fail our instructor's test harness.

### [Iteration 2](https://backend.turing.edu/module1/projects/battleship/iteration_2)
Iteration 2 was our first opportunity to choose what we thought would be the best process from a variety of seemingly feasible choices. The interaction pattern made test development as straightforward as iteration 1, but how we satisfied those tests seemed almost open to interpretation.

We ultimately decided that we wanted to challenge ourself on this project, with our eyes on creating a dynamic board in iteration 4 capable of responding to user defined dimensions. Instead of manually creating each cell instance in the Board class's initialize method, we used an enumerable that would generate a coordinate "x" amount of times, for a "y" number of iterations and manually replaced "x" with an array from A to D and "y" with 4 to default to a 4x4 board that would satisfy our interaction pattern.

Accepting this challenge early put us in a design mindset that carried over to our valid_placement? method. We wanted to create a scalable method for any size board, so we spent a lot of time talking about edge cases. Our planning resulted in this flowchart that we guided our coding off of.

![image](https://user-images.githubusercontent.com/92219945/146100093-a77b49a1-6d7d-47fc-896c-1a7de4f90097.png)

Each method listed became a helper method with valid_placement? providing the conditionals as illustrated above. The care and thought put into this crucial block of code paid off, as it became the foundation for our code in all of the iterations following it. Finally our approach to rendering the board was to use our same enumerable set up in our instance to generate the coordinates we wanted with formatting done to meet the interaction pattern. Later we would target this for refactoring, realizing that duplicate code could be combined into one helper method and that we could make our formatting dynamic to accomodate a user defined board.

### [Iteration 3](https://backend.turing.edu/module1/projects/battleship/iteration_3)
In iteration 3 we used the logic framework defined in iteration 2 to create our computer's behavior in setting up their ships. First, we created a computer class to handle all of the computer's interactions with a turn. The intent of creating a computer class was to expand upon it in iteration 4. In this class, we created a helper method to randomly decide if the ship would be oriented vertically or horizontally. Then the computer would generate coordinates along that orientation from left to right or top to bottom in accordance to the length of the ship. Each array of coordinates was then validated using the methods defined in cells and would repeat for an invalid result. Originally the Computer create their own instances of ships, but the decision was made to move this functionality to the Turn to make user defined dynamic ships more attainable. Finally, the Turn class was created with all remaining user facing functionality, and a runner file was created to allow the game to be played in terminal.

## Expanding The Game
In iteration4 we built out two of the optional three functionalities. Our first functionality that we built out was the ability for the user to choose the length and height of the board. This function operates completely with no known errors or bugs. The second functionality we built was the intelligent computer. This functionality enabled the computer to fire methodically in an attempt to sink the user ships. This method began with computer firing across the board diagonally (in both directions) until a hit was obtained. If a hit is not obtained in this pattern, the computer fires randomly in the 4 triangular shapes leftover. Once a hit is obtained, the computer selects the four cells surrounding it (the two cells directly next to it horizontally and the two directly next to it vertically). This computer intelligence operates fully on a board size of less then 6 x 6. We encountered a few edge cases that caused some errors in larger boards. We decided not to merge this branch as time did not allow us to fully refactor and debug the issues within the code. All iteration4 work can be found on the sandbox2 branch and was not submitted as a part of our final assignment.  
