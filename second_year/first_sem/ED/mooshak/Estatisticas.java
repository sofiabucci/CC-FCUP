import java.util.Scanner;

public class Estatisticas {

    public static int amplitude(int n, int v[]){
        int max = v[0];
        int min = v[0];

        for (int i=1; i<n; i++){
            if (v[i]>max) max = v[i];
            else if(v[i]<min) min = v[i];

        }
        return (max-min);
    }
    public static void main(String args[]){
        Scanner stdin = new Scanner(System.in);

        int n = stdin.nextInt();
        int v[] = new int[n];
        double s = 0;

        for (int i=0; i<n; i++){
            v[i]=stdin.nextInt();
            s+=v[i];
        }

        System.out.printf("%.2f\n", s/n);
        System.out.println(amplitude(n,v));
        stdin.close();
    }
}
