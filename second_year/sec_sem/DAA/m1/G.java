import java.util.*;

public class G{ 
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int D = in.nextInt();
        int T = in.nextInt();

        String[] tentativas = new String[T];
        String[] feedbacks = new String[T];

        in.nextLine(); 

        for (int i = 0; i < T; i++) {
            tentativas[i] = in.nextLine();
            feedbacks[i] = in.nextLine();
        }


        in.close();
    }

}