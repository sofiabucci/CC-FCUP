import java.util.Scanner;

class Game{
    int k;
    int frase;
    CircularLinkedList<String> players;
 
    Game(){
       k=0;
       players = new CircularLinkedList<String>();
       frase=0;
    }
 
    public void read(Scanner in){
       String s = in.nextLine();
       frase=s.split(" ").length;
       k= in.nextInt();
       for (int j=0; j<k; j++){
          String name = in.next();
          players.addLast(name);
       }
       in.nextLine();
    }
 
    public void result(){
        String c = "";
        while (players.size() > 1) {
           for (int i = 0; i < frase - 1; i++) {
              players.rotate();
           }
           String p = players.getFirst();
           players.removeFirst();
           if (p.equals("Carlos")) {
              c=p;
           }
        }
        String u = players.getFirst();
        if (c.equals("Carlos")){
           System.out.println("O Carlos livrou-se (coitado do " + u + "!)");
        }
        else System.out.println("O Carlos nao se livrou");
        
     }
 }
 
public class ED006{
    public static void main(String[] args) {
       Scanner in = new Scanner(System.in);
    
       int n= in.nextInt();
       in.nextLine();
       for (int i=0; i<n; i++){
          Game jogo = new Game();
          jogo.read(in);
          jogo.result();
       }
       in.close();
    }
}