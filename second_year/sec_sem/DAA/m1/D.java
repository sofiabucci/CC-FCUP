import java.util.*;

public class D{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        int[] cadeiras = new int[n+1];

        for(int i=0; i<n; i++){
            int t = in.nextInt();
            int v = in.nextInt();
            cadeiras[t]=v;
        }

        int h= in.nextInt();
        int p=h;

        for(int i=0; i<h; i++){
            int s = in.nextInt();
            if (s==0){
                for(int j=1; j<=n; j++){
                    if (cadeiras[j]>0){
                        cadeiras[j]--;
                        p--;
                        break;
                    }
                }
            }
            else{
                int[] sl = new int[s]; 
                for(int j=0; j<s; j++){
                    sl[j]= in.nextInt();
                }
                for(int j=0; j<s; j++){
                    if (cadeiras[sl[j]]>0){
                        cadeiras[sl[j]]--;
                        p--;
                        break;
                    }
                }
            }
        
        }

        int cl = Arrays.stream(cadeiras).sum();

        System.out.println(p);
        System.out.println(cl);

        in.close();
    }

}


