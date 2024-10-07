import java.util.Scanner;

class Matrix {
    char data[][]; 
    int l,c;     
    
    Matrix(int l, int c) {
        data = new char[l][c];
        this.l = l;
        this.c = c;
    }

    public void read(Scanner in) {
        for (int i=0; i<this.l; i++){
            String line = in.next();
            for (int j=0; j<this.c; j++){
                data[i][j] = line.charAt(j);
            }
        }
    }
}

class Result {
    int max, count; 

    public Result(int max, int count) {
        this.max = max;
        this.count = count;
    }
}


public class ContandoCardinais {

    public static Result ContaSegmento(Matrix m, int l, int c){
        int x=0, max=0, n=1;

        for (int i = 0; i<l; i++){
            for (int j = 0; j<c; j++){
                if (m.data[i][j]=='#') x++;
                else {
                    if (x>max) {
                        max=x;
                        n=1;
                    }
                    else if (x==max){
                        n++;
                    }
                    x=0;
                };
            }
            if (x>max) {
                max=x;
                n=1;
            }
            else if (x==max){
                n++;
            }
            x=0;
        }

        for (int j = 0; j<c; j++){
            for (int i = 0; i<l; i++){
                if (m.data[i][j]=='#') x++;
                else if (m.data[i][j]=='.') {
                    if (x>max) {
                        max=x;
                        n=1;
                    }
                    else if (x==max){
                        n++;
                    }
                    x=0;
                };
            }
            if (x>max) {
                max=x;
                n=1;
            }
            else if (x==max){
                n++;
            }
            x=0;
        }

        return new Result(max, n);
    }   
    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);
        int l = stdin.nextInt();
        int c = stdin.nextInt();

        Matrix m = new Matrix(l,c);
        m.read(stdin);

        Result result = ContaSegmento(m, l, c);
        System.out.println(result.max +" "+ result.count);
    }   
}
