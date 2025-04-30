Game of Life Implementation Documentation

1. ARCHITECTURE OVERVIEW
-----------------------
The implementation consists of two modules:
- life.pl: Core simulation logic
- main.pl: User interface and controls

2. WORLD REPRESENTATION
-----------------------
The world is represented as a structure:
world(LiveCells, Generation)
- LiveCells: Sorted list of cell(X,Y) terms
- Generation: Integer count of evolution steps

3. KEY ALGORITHMS
-----------------
3.1 Evolution Process:
- Collect all candidate cells (live cells + neighbors)
- For each candidate:
  - Count living neighbors
  - Apply rules to determine new state
- Filter cells that remain alive
- Increment generation counter

3.2 Rule System:
- Uses dynamic predicates for flexible rules
- Two rule types:
  - birth: Numbers of neighbors causing birth
  - survival: Numbers allowing survival
- Default: Conway's B3/S23 rules

4. VISUALIZATION
---------------
- Prints grid with Unicode block characters
- Automatically adjusts to visible cells
- Shows generation count

5. PERFORMANCE OPTIMIZATIONS
---------------------------
- Sorted cell lists for efficient membership checks
- Candidate cell pruning (only consider relevant cells)
- Avoid recalculating neighbors through memoization

6. EXTENSION POINTS
------------------
6.1 Adding New Patterns:
- Add to pattern/2 predicate in life.pl
- Format: pattern(name, [cell(X1,Y1), cell(X2,Y2), ...]).

6.2 Custom Rules:
- Use set_rule/2 to modify birth/survival conditions
- Example: set_rule(birth, [3,6]) for HighLife variant

7. USAGE EXAMPLES
----------------
7.1 Running Patterns:
?- life(glider, 20).     % Run gl