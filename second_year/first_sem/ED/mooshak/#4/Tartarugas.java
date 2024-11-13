import java.util.Scanner;

class Turtle {
    static final char MARK = '*';
    static final char EMPTY = '.';
    int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}; 
    int direction = 0; 
    boolean penDown = false;
    int x = 0, y = 0;
    int rows, cols;
    char[][] grid;

    public Turtle(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
        grid = new char[rows][cols];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                grid[i][j] = EMPTY;
            }
        }
    }

    public void executeCommand(String command) {
        if (command.startsWith("F")) {
            int steps = Integer.parseInt(command.split(" ")[1]);
            moveForward(steps);
        } else if (command.equals("U")) {
            penDown = false;
        } else if (command.equals("D")) {
            penDown = true;
        } else if (command.equals("L")) {
            turnLeft();
        } else if (command.equals("R")) {
            turnRight();
        }
    }

    public void moveForward(int steps) {
        for (int i = 0; i < steps; i++) {
            int newX = x + directions[direction][0];
            int newY = y + directions[direction][1];
    
            if (newX >= 0 && newX < rows && newY >= 0 && newY < cols) {
                x = newX;
                y = newY;
                if (penDown) {
                    grid[x][y] = MARK;
                }
            } else {
                break; 
            }
        }
    }

    public void turnLeft() {
        direction = (direction + 3) % 4;
    }

    public void turnRight() {
        direction = (direction + 1) % 4; 
    }

    public char[][] getGrid() {
        return grid;
    }

    public void printGrid() {
        for (char[] row : grid) {
            for (char cell : row) {
                System.out.print(cell + " ");
            }
            System.out.println();
        }
    }

    public void printStats() {
        int marked = 0;
        int emptyRows = 0;
        int emptyCols = 0;

        for (char[] row : grid) {
            for (char cell : row) {
                if (cell == MARK) {
                    marked++;
                }
            }
        }

        int total = grid.length * grid[0].length;
        int percentage = (marked * 100) / total;

        for (char[] row : grid) {
            boolean empty = true;
            for (char cell : row) {
                if (cell == MARK) {
                    empty = false;
                    break;
                }
            }
            if (empty) {
                emptyRows++;
            }
        }

        for (int j = 0; j < grid[0].length; j++) {
            boolean empty = true;
            for (int i = 0; i < grid.length; i++) {
                if (grid[i][j] == MARK) {
                    empty = false;
                    break;
                }
            }
            if (empty) {
                emptyCols++;
            }
        }

        System.out.println(percentage + " " + emptyRows + " " + emptyCols);
    }
}

class PatternMatcher {
    public static boolean patternMatches(char[][] grid, char[][] pattern) {
        for (int i = 0; i <= grid.length - pattern.length; i++) {
            for (int j = 0; j <= grid[0].length - pattern[0].length; j++) {
                if (patternFound(grid, pattern, i, j)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean patternFound(char[][] grid, char[][] pattern, int x, int y) {
        for (int i = 0; i < pattern.length; i++) {
            for (int j = 0; j < pattern[0].length; j++) {
                if (pattern[i][j] == Turtle.MARK && grid[x + i][y + j] != Turtle.MARK) {
                    return false;
                }
            }
        }
        return true;
    }
}

public class Tartarugas {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int flag = scanner.nextInt();

        int rows = scanner.nextInt();
        int cols = scanner.nextInt();
        scanner.nextLine(); 

        Turtle turtle = new Turtle(rows, cols);

        String command;
        while (!(command = scanner.nextLine()).equals("end")) {
            turtle.executeCommand(command);
        }

        if (flag == 0) {
            turtle.printGrid();
        } else if (flag == 1) {
            turtle.printStats();
        } else if (flag == 2) {
            int patternRows = scanner.nextInt();
            int patternCols = scanner.nextInt();
            scanner.nextLine(); 

            char[][] pattern = new char[patternRows][patternCols];
            for (int i = 0; i < patternRows; i++) {
                pattern[i] = scanner.nextLine().toCharArray();
            }

            if (PatternMatcher.patternMatches(turtle.getGrid(), pattern)) {
                System.out.println("Sim");
            } else {
                System.out.println("Nao");
            }
        }

        scanner.close();
    }
}
