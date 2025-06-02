import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class Maps {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Map<Integer, Integer> freqs = new TreeMap<>();
        
        int n = scanner.nextInt();
        
        for (int i = 0; i < n; i++) {
            int key = scanner.nextInt();
            int value = scanner.nextInt();
            freqs.put(key, freqs.getOrDefault(key, 0) + value);
        }
        
        // Access using an iterator
        for (Map.Entry<Integer, Integer> entry : freqs.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
             
        scanner.close();
    }
}
