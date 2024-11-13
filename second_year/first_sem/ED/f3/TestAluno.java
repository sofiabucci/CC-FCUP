import java.util.Scanner

class Aluno {
    String nome;
    int numero;
 
    Aluno(string n, int mec) {
       nome   = n;
       numero = mec;
    }

    public String toString() {
        return "(" + nome + "," + numero + ")";
    }

    int ano() {
        return numero / 100000;
    }
 }
 
 public class TestAluno {
    public static void main(String[] args) {
        Scanner stdin = new Scanner(System.in);

        int n = stdin.nextInt();

        Aluno[] alunos = new Aluno[n];
        for (int i=0; i<n; i++){
            alunos[i].nome= stdin.nextLine();
            alunos[i].numero= stdin.nextInt();
        }

        for (int i=0; i<n; i++){
            System.out.println(alunos[i].toString());
        }

    }
 }