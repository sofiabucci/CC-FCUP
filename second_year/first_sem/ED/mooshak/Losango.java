import java.util.Scanner;

public class Losango {
    static void line(int n, int pontos) {
        for (int i = 0; i < pontos; i++) {
            System.out.print(".");
        }
        for (int i = 0; i < n; i++) {
            System.out.print("#");
        }
        for (int i = 0; i < pontos; i++) {
            System.out.print(".");
        }
        System.out.println();
    }

    static void losang(int n) {
        for (int i = 1; i <= n; i += 2) {
            line(i, (n - i) / 2);
        }
        for (int i = n - 2; i >= 1; i -= 2) {
            line(i, (n - i) / 2);
        }
    }
    public static void main(String[] args) {	
        Scanner obj = new Scanner(System.in);
        int a = obj.nextInt();
        losang(a);
    }
}
