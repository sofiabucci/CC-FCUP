import java.util.Scanner;

public class Palindromos {
    static boolean isPalindrome(String s){
        s = s.toLowerCase().replaceAll("[^a-zA-Z0-9]", "");
        int n = s.length() - 1;

        for (int i=0; i<n; i++){
            if (s.charAt(i) == s.charAt(n)){
                --n;
            }
            else return false;
        }

        return true;
    }

    public static void main(String[] args) {	
        Scanner obj = new Scanner(System.in);
        int n = obj.nextInt();
        System.out.println(n);
        obj.nextLine();
        for (int i=0; i<n; i++){
            String p = obj.nextLine();
            if (isPalindrome(p)) System.out.println("sim");
            else System.out.println("nao");
        }
        obj.close();
    }
}

