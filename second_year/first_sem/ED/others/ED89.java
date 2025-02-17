import java.util.*;

public class ED89 {

    public static void flag0(Map<Integer,Integer> e){
        System.out.println(e.size());
    }

    public static void flag1(Map<Integer,Integer> e){
        Map<Integer, Integer> ord = new TreeMap<>(e);
        ord.forEach((key, value) -> System.out.println(key + " " + value));
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();
        int f = in.nextInt();
        in.nextLine();

        Map<Integer,Integer> empresas = new HashMap<>();

        for(int i=0; i<n; i++){
            int nif = in.nextInt();
            in.nextLine();                  
            String nome = in.nextLine();
            String a = in.nextLine();
            int c = in.nextInt();
            in.nextLine();                  
            int r = in.nextInt();
            in.nextLine();


            empresas.put(c, r + empresas.getOrDefault(c, 0));
        }

        if (f==0) flag0(empresas);
        if (f==1) flag1(empresas);
    }
}
