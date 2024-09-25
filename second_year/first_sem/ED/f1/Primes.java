public class Primes {
    static boolean isPrime(int n) {
        for (int i=2; i*i <=n; i++){
            if (n%i == 0)
                return false;
        }
        return true;
    }

    static void primeFactors(int n) {
        if (n==1 || isPrime(n)) {
            System.out.print(n);
        }
        else {
            for (int i=2; i<=n; i++){
                while ( isPrime(i) && n%i==0){
                    System.out.println(i+"*");
                    n/=i;
                }
            }
        }

    }

    public static void main(String[] args) {
        int n = 20;
        primeFactors(n);
    }
}
