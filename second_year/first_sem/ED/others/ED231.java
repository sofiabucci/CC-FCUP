import java.util.*;

public class ED231 {

    public static void flag1(int[] seq){
        int min = seq[0];
        int max = seq[0];

        for(int i=1; i<seq.length; i++){
            if (seq[i]>max) max = seq[i];
            if (seq[i]<min) min = seq[i];
        }

        System.err.println(min +" "+ max);
    }

    public static void flag2(int[] seq){
        int qnt = 0;
        int tam = 0;
        int c = 1;

        for(int i=1; i<seq.length; i++){
            double p = (seq[i]-seq[i-1])/seq[i-1];

            if (p<=0.05) tam ++;
            if (p>0.05) {
                qnt ++;
                if (c>tam) {
                    tam = c;
                    c = 1;
                }
            }
        }

        System.err.println(qnt +" "+ tam);

    }
    public static void flag3(int[] seq){
        int max = seq[seq.length-1]/100;

        char[][] m = new char[max][seq.length];

        for(int i=0; i<seq.length; i++){
            int p = seq[i]/100;
            for(int j=0; j<(max) - p; j++){
                m[j][i]='.';
            }
            for(int j=(max) - p; j< p; j++){
                m[j][i]='#';
            }
        }

        for(int i=0; i<max; i++){
            for(int j=0; j<seq.length; j++){
                System.out.println(m[i][j]);
            }
            System.out.println();
        }

    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();
        in.nextLine();

        int[] seq = new int[n];

        for(int i=0; i<n; i++){
            seq[i]=in.nextInt();
        }
        in.nextLine();

        int f = in.nextInt();

        if (f==1) flag1(seq);
        if (f==2) flag2(seq);
        if (f==3) flag3(seq);
    }
}
