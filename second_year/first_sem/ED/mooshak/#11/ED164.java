import java.util.*;

public class ED164{
    public static void main (String args[]){
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        BSTree<String> tree = new BSTree<String>();

        for (int i=0; i<n; i++){
            tree.insert(in.next());
        }

        System.out.println(tree.numberNodes());
    }
}