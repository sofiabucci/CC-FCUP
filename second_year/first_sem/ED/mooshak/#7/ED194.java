
interface MyStack<T> {
   // Metodos que modificam a pilha
   public void push(T v); // Coloca um valor no topo da pilha
   public T pop();        // Retira e retorna o valor no topo da pilha

   // Metodos que acedem a informacao (sem modificar)
   public T top();           // Retorna valor no topo da pilha
   public int size();        // Retorna quantidade de elementos na pilha
   public boolean isEmpty(); // Indica se a pilha esta vazia
}

class ArrayStack<T> implements MyStack<T> {
   public static final int CAPACITY = 1000; // Capacidade padrao   
   private T[] data;  // Array para conter elementos
   private int size;  // Quantidade de elementos

   ArrayStack() {
      this(CAPACITY);
   }

   @SuppressWarnings("unchecked")
   ArrayStack(int capacity) {
      data = (T[]) new Object[capacity];
      size = 0;
   }
   
   public void push(T v) {
      if (size >= data.length) throw new RuntimeException("Stack is full");
      data[size++] = v;
   }
   
   public T pop() {
      if (isEmpty()) return null;
      return data[--size];
   }
   
   public T top() { return data[size-1];}
   public int size() {return size;}
   public boolean isEmpty() {return (size==0);}

   public String toString() {
      String str = "[";
      for (int i=size-1; i>=0; i--) {
         str += data[i];
         if (i>0) str += ",";
      }
      str += "]";
      return str;
   }
}


public class ED194 {
   public static void reverse(MyStack<Integer> s,int n){
      int[] list = new int[n];
      for (int i=0; i<n; i++){
         list[i]=s.pop();
      }
      for (int i=0; i<n; i++){
         s.push(list[i]);
      }
   }
   public static void main(String[] args) {
      MyStack<Integer> s = new ArrayStack<>();
      for (int i=5; i>0; i--)
         s.push(i);
      System.out.println(s); 
      reverse(s, 3);
      System.out.println(s); 
   }
}
