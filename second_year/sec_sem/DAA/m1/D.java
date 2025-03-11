import java.util.*;

public class D{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        Map<Integer,Integer> cadeiras = new HashMap<>();

        for(int i=0; i<n; i++){
            int t = in.nextInt();
            int v = in.nextInt();
            cadeiras.put(t,v);
        }

        int h= in.nextInt();
        int p=h;

        for(int i=0; i<h; i++){
            int s = in.nextInt();
            for(int j=0; j<s; j++){
                int c = in.nextInt();
                if (cadeiras.getOrDefault(c, 0)>0) {
                    p--;
                    cadeiras.put(c, cadeiras.get(c)-1);
                    break;
                }

            }
        }

        int cl = cadeiras.values().stream().mapToInt(Integer::intValue).sum();

        System.out.println(p);
        System.out.println(cl);
    }

}


