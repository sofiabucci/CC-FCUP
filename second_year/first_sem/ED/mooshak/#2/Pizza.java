import java.util.Scanner;

public class Pizza {

    public static boolean pizza(int a[],int b[]){
        for (int as : a){
            for (int bs : b){
                if (as==bs) return false;
            }
        }
        return true;
    }

    public static void main(String args[]){
        Scanner stdin = new Scanner(System.in);

        int n = stdin.nextInt();
        int a[] = new int[n];

        for(int i=0; i<n; i++){
            a[i]=stdin.nextInt();
        }

        int p = stdin.nextInt();
        int s = 0;

        for(int i=0; i<p; i++){
            int x=stdin.nextInt();
            int b[] = new int[x];

            for (int j=0; j<x; j++){
                b[j]=stdin.nextInt();
            }

            if (pizza(a,b)) s++;
        }

        System.out.println(s);
        stdin.close();
    }
}
