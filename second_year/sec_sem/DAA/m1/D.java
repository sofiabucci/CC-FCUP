import java.util.*;

public class D{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        int[] cadeiras = new int[n+1];

        for(int i=1; i<=n; i++){
            int t = in.nextInt();
            int v = in.nextInt();
            cadeiras[t]=v;
        }

        int h= in.nextInt();
        int p=h;

        for(int i=0; i<h; i++){
            int s = in.nextInt();

            int[] sl = new int[s]; 

            for(int j=0; j<s; j++){
                sl[j]= in.nextInt();
            }
            
            for(int k=0; k<s; k++){
                if (cadeiras[sl[k]]>0){
                    cadeiras[sl[k]]--;
                    p--;
                    break;
                }
            }
            
        
        }

        int c = Arrays.stream(cadeiras).sum();

        System.out.println(p);
        System.out.println(c);

        in.close();
    }

}


