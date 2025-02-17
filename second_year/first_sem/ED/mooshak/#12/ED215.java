import java.util.*;

class Person implements Comparator<Person>{
    private String name;
    private int price;

    Person(String n, int p){
        name = n;
        price = p;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public int compare(Person p1, Person p2) {
        return Integer.compare(p2.price, p1.price); 
    }
}

public class ED215{
    public static void main (String args[]){
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();
        in.nextLine(); 

        MinHeap<Person> heap = new MinHeap<>(n, new Person("", 0));

        for (int i=0; i<n; i++){
            String s = in.next();
            if (s.equals("OFERTA")){
                String nome = in.next();
                int preco = in.nextInt();

                heap.insert(new Person(nome,preco));
            }
            else {
                Person venda = heap.removeMin();
                System.out.println(venda.getPrice()+" "+venda.getName());
            }
            in.nextLine();
        }
        
    }
}