import java.util.Scanner;

class Game {
    final char DEAD  = '.';  // Constante que indica uma celula morta
    final char ALIVE = 'O';  // Constante que indica uma celula viva
    private int rows, cols;  // Numero de linhas e colunas
    private char m[][];      // Matriz para representar o estado do jogo

    // Construtor: inicializa as variaveis tendo em conta a dimensao dada
    Game(int r, int c) {
	rows = r;
	cols = c;
	m = new char[r][c];
    }

    // Metodo para ler o estado inicial para a matriz m[][]
    public void read(Scanner in) {
	for (int i=0; i<this.rows; i++)
	    this.m[i] = in.next().toCharArray();
    }
    
    // Metodo para escrever a matriz m[][]
    public void write() {
    for (int i=0; i<this.rows; i++) {
        for (int j=0; j<this.cols; j++)
            System.out.print(this.m[i][j] + " ");
        System.out.println("");;
    }
    }

    // Deve devolver o numero de celulas vivas que sao vizinhas de (y,x)
    private int countAlive(int y, int x) {
	int count = 0;
	for (int i=this.rows -1 ; i<=this.rows +1; i++) {
        for (int j=this.cols -1; j<=this.cols +1; j++)
            if(this.m[i][j]=='O' && (i!=this.rows || j!=this.cols)) count ++;
    }
	return count;
    }

    // Deve fazer uma iteracao: cria nova geracao a partir da actual
    public void iterate() {
	char mn = new char[][];
    }

}

public class JogoDaVida {
    public static void main(String[] args) {
	Scanner in = new Scanner(System.in);

	// Ler linhas, colunas e numero de iteracoes
	int rows = in.nextInt();
	int cols = in.nextInt();
	int n    = in.nextInt();

	// Criar objecto para conter o jogo e ler estado inicial
	Game g = new Game(rows, cols);
	g.read(in);
	
	g.write();
    }