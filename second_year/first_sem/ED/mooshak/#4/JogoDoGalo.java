import java.util.Scanner;

class Matrix {
    char data[][]; 
    int n;     
    

    Matrix(int n) {
        data = new char[n][n];
        this.n = n;
    }

    public void read(Scanner in) {
        for (int i=0; i<n; i++){
            String line = in.next();
            for (int j=0; j<n; j++){
                data[i][j] = line.charAt(j);
            }
        }
    }
}


public class JogoDoGalo {

    public static String GameState(Matrix m, int n){
        int x, o;

        for (int i = 0; i<n; i++){
            x=0;
            o=0;
            for (int j = 0; j<n; j++){
                if (m.data[i][j]=='X') x++;
                else if (m.data[i][j]=='O') o++;
            }
            if (x==n) return "Ganhou o X";
            else if (o==n) return "Ganhou o O";
        }

        for (int i = 0; i<n; i++){
            x=0;
            o=0;
            for (int j = 0; j<n; j++){
                if (m.data[j][i]=='X') x++;
                else if (m.data[j][i]=='O') o++;
            }
            if (x==n) return "Ganhou o X";
            if (o==n) return "Ganhou o O";
        }

        x=0;
        o=0;
        for (int i = 0; i<n; i++){
            if (m.data[i][i]=='X') x++;
            else if (m.data[i][i]=='O') o++;
        }
        if (x==n) return "Ganhou o X";
        if (o==n) return "Ganhou o O";

        x=0;
        o=0;
        for (int i = 0; i<n; i++){
            if (m.data[i][n-1-i]=='X') x++;
            else if (m.data[i][n-1-i]=='O') o++;
        }
        if (x==n) return "Ganhou o X";
        if (o==n) return "Ganhou o O";
        
        x=0;
        o=0;
        for (int i = 0; i<n; i++){
            for (int j = 0; j<n; j++){
                if (m.data[i][j]=='.') return "Jogo incompleto";
            }
        }

        return "Empate";
    }   
    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);
        int n = stdin.nextInt();

        Matrix m = new Matrix(n);
        m.read(stdin);

        System.out.println(GameState(m, n));
    }   
}
