import java.util.Scanner;

class Sopa {
    char[][] sopa; 
    char[][] resultado; 
    int rows, cols;

    Sopa(int r, int c) {
        rows = r;
        cols = c;
        sopa = new char[r][c];
        resultado = new char[r][c];

        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                this.resultado[i][j] = '.';
            }
        }
    }

    public void read(Scanner in) {
        for (int i = 0; i < this.rows; i++) {
            this.sopa[i] = in.next().toCharArray();
        }
    }

    public void write() {
        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                System.out.print(this.resultado[i][j]);
            }
            System.out.println();
        }
    }

    public void findWords(String palavra) {
        int len = palavra.length();

        for (int i = 0; i < this.rows; i++) {
            for (int j = 0; j < this.cols; j++) {
                if (this.sopa[i][j] == palavra.charAt(0)) {
                    if (j + len <= this.cols && verificaHorizontal(i, j, palavra, 1)) {
                        marcaHorizontal(i, j, palavra, 1);
                    }
                    if (j - len + 1 >= 0 && verificaHorizontal(i, j, palavra, -1)) {
                        marcaHorizontal(i, j, palavra, -1);
                    }
                    if (i + len <= this.rows && verificaVertical(i, j, palavra, 1)) {
                        marcaVertical(i, j, palavra, 1);
                    }
                    if (i - len + 1 >= 0 && verificaVertical(i, j, palavra, -1)) {
                        marcaVertical(i, j, palavra, -1);
                    }
                }
            }
        }
    }

    private boolean verificaHorizontal(int i, int j, String palavra, int direcao) {
        for (int k = 0; k < palavra.length(); k++) {
            if (this.sopa[i][j + k * direcao] != palavra.charAt(k)) {
                return false;
            }
        }
        return true;
    }

    private void marcaHorizontal(int i, int j, String palavra, int direcao) {
        for (int k = 0; k < palavra.length(); k++) {
            this.resultado[i][j + k * direcao] = this.sopa[i][j + k * direcao];
        }
    }

    private boolean verificaVertical(int i, int j, String palavra, int direcao) {
        for (int k = 0; k < palavra.length(); k++) {
            if (this.sopa[i + k * direcao][j] != palavra.charAt(k)) {
                return false;
            }
        }
        return true;
    }

    private void marcaVertical(int i, int j, String palavra, int direcao) {
        for (int k = 0; k < palavra.length(); k++) {
            this.resultado[i + k * direcao][j] = this.sopa[i + k * direcao][j];
        }
    }
}

public class SopaDeLetras {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int caso = 0;

        while (true) {
            int rows = in.nextInt();
            int cols = in.nextInt();

            if (rows == 0 && cols == 0) {
                break; 
            }

            caso++;
            Sopa sopa = new Sopa(rows, cols);
            sopa.read(in);

            int n = in.nextInt();
            in.nextLine();

            for (int i = 0; i < n; i++) {
                String palavra = in.nextLine();
                sopa.findWords(palavra);
            }

            System.out.println("Input #" + caso);
            sopa.write();
        }

        in.close();
    }
}
