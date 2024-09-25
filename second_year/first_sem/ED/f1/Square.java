public class Square {
    static void line(char a, char b, int n) {
        System.out.print(a);
        for (int i=1; i<=n-2; i++)
            System.out.print(b);
        System.out.println(a);
    }

    static void square(int n){
        line('+', '-', n);
        for (int i=1; i<=n-2; i++)
            line('|', '.', n);
        line('+', '-', n);

    }

    static void losang(int n) {
        for (int i = 1; i <= n; i += 2) {
            for (int j = 0; j < (n - i) / 2; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < i; k++) {
                System.out.print("*");
            }
            System.out.println();
        }

        for (int i = n - 2; i >= 1; i -= 2) {
            for (int j = 0; j < (n - i) / 2; j++) {
                System.out.print(" ");
            }
            for (int k = 0; k < i; k++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
    public static void main(String[] args) {	
        line(' ', '*', 5);
        losang(5);	    
    }
}

