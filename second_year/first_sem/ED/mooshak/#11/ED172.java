import java.util.Scanner;

public class ED172 {
    static BSTMap<String, Integer> dic;

    public static void checkWord(String word, BSTMapNode<String,Integer> root){
        if (root ==null){
            dic.put(word, 1);
            return;
        }
        if (root.getKey().equals(word)) {
            root.setValue(root.getValue()+1);
        }
        if (root.getKey().compareTo(word) > 0){
            checkWord(word, root.getLeft());
        }
        if (root.getKey().compareTo(word) < 0){
            checkWord(word, root.getRight());
        }
    }

    public static void printar(){
        printar(dic.getRoot());
    }

    private static void printar(BSTMapNode<String,Integer> root){
        if (root==null) return;
        printar(root.getLeft());
        System.out.println(root.getKey() + ": " + root.getValue());
        printar(root.getRight());
    }

  

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        dic = new BSTMap<>();
        while (input.hasNext()){
            String [] wordsInTheLine = input.nextLine().split("\\s++");
            for (String word : wordsInTheLine)    {
                checkWord(word, dic.getRoot());
            }
        }
        printar();
    }
}
