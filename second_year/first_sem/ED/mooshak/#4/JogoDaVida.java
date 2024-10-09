import java.util.Scanner;

class Game {
    final char DEAD  = '.'; 
    final char ALIVE = 'O';  
    private int rows, cols;  
    private char m[][];      

    Game(int r, int c) {
	rows = r;
	cols = c;
	m = new char[r][c];
    }

    public void read(Scanner in) {
	for (int i=0; i<this.rows; i++)
	    this.m[i] = in.next().toCharArray();
    }
    
    public void write() {
    for (int i=0; i<this.rows; i++) {
        for (int j=0; j<this.cols; j++)
            System.out.print(this.m[i][j]);
        System.out.println();;
    }
    }

    private int countAlive(int y, int x) {
	int count = 0;
	for (int i=y-1 ; i<=y+1; i++) {
        for (int j=x-1; j<=x+1; j++){
            if(i>=0 && i<this.rows && j>=0 && j<this.cols && (i!=y || j!=x)){
                if (this.m[i][j]==ALIVE) count++;
            }
        }
    }
	return count;
    }

    public void iterate() {
	char[][] mn = new char[this.rows][this.cols];
    for (int i=0 ; i<this.rows; i++) {
        for (int j=0; j<this.cols; j++){
            int n=countAlive(i, j);

            if(this.m[i][j]==ALIVE){
                if(n<2 || n>3){
                    mn[i][j]=DEAD;
                }
                else {
                    mn[i][j]=ALIVE;
                }
            }
            else {
                if(n==3) {mn[i][j]=ALIVE;}
                else {mn[i][j]=DEAD;}
            }
        }
    }
    this.m=mn;
    }
}

public class JogoDaVida {
    public static void main(String[] args) {
	Scanner in = new Scanner(System.in);

	int rows = in.nextInt();
	int cols = in.nextInt();
	int n    = in.nextInt();

	Game g = new Game(rows, cols);
	g.read(in);
	
    for(int i=0; i<n; i++){
        g.iterate();
    }

	g.write();
    }
}