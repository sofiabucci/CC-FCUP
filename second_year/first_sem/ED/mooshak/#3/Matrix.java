import java.util.Scanner;

class Matrix {
    int data[][]; 
    int rows;     
    int cols;     

    Matrix(int r, int c) {
        data = new int[r][c];
        rows = r;
        cols = c;
    }

    public void read(Scanner in) {
        for (int i=0; i<rows; i++)
        for (int j=0; j<cols; j++)
            data[i][j] = in.nextInt();
    }

    public String toString() {
        String ans = "";
        for (int i=0; i<rows; i++) {
            for (int j=0; j<cols; j++)
                ans += data[i][j] + " ";
            ans += "\n";
        }
        return ans;
        }   

    public static Matrix identity(int n){
        Matrix m = new Matrix(n,n);

        for (int i=0; i<n; i++){    
            m.data[i][i]= 1;
        }

        return m;
    }

    public Matrix transpose(){
        Matrix t = new Matrix(this.cols, this.rows);

        for (int i=0; i<this.cols; i++){
            for (int j=0; j<this.rows; j++){
                t.data[i][j]=this.data[j][i];
            }
        }

        return t;
    }

    public Matrix sum(Matrix m){
        Matrix s = new Matrix (this.rows, this.cols);

        for (int i=0; i<this.rows; i++){
            for (int j=0; j<this.cols; j++){
                s.data[i][j]=this.data[i][j]+m.data[i][j];
            }
        }

        return s;
    }

    public Matrix multiply(Matrix m){
        Matrix x = new Matrix (this.rows, m.cols);

        for (int i=0; i<this.rows; i++){
            for (int j=0; j<m.cols; j++){
                x.data[i][j]=0;
                for (int k=0; k<this.cols; k++){
                    x.data[i][j]+=this.data[i][k]*m.data[k][j];
                }
            }
        }

        return x;
    }   
}