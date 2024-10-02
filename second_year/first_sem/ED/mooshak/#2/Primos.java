import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Primos {
    static boolean isPrime(int n) {
        for (int i=2; i*i <= n; i++){
            if (n%i == 0)
                return false;
        }
        return true;
    }

    static List<Integer> eratosthenes(int n){
        boolean[] prime = new boolean [n+1];
        for (int i = 2; i <= n; i++) {
            prime[i] = true;
        }

        for (int p = 2; p * p <= n; p++) {
            if (prime[p]) {
                for (int i = p * p; i <= n; i += p) {
                    prime[i] = false;
                }
            }
        }

        List<Integer> primes = new ArrayList<>();
        for (int i = 2; i <= n; i++) {
            if (prime[i]) {
                primes.add(i);
            }
        }
        return primes;
    }
    static int primesInRange(int a, int b) {
        List<Integer> allPrimes = eratosthenes(b);
        int count = 0;
        for (int prime : allPrimes) {
            if (prime >= a) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        Scanner obj = new Scanner(System.in);
        int a = obj.nextInt();
        int b = obj.nextInt();
        System.out.print(primesInRange(a, b) +"\n");
        obj.close();
    }
}
