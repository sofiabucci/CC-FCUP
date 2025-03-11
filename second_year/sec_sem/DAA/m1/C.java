import java.util.*;

public class C {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        List<Integer> locais = new ArrayList<>();

        while (true){
            int local = in.nextInt();
            if (local==0) break;

            if (locais.contains(local)) {
                int index = locais.lastIndexOf(local);
                locais.subList(index + 1, locais.size()).clear();
            }
            else {
                locais.add(local);
            }

        }

        in.close();

        for(int local:locais){
            System.out.println(local);
        }
    }
    
}
