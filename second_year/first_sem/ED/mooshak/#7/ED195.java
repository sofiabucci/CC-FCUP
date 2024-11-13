
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

public class ED195 {
    public static boolean balanced(String s){
        MyStack<Character> stack = new ArrayStack<>();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '(' || c == '[') {
                stack.push(c);
            }
            else if (c == ')' || c == ']') {
                if (stack.isEmpty()) {
                    return false; 
                }
                char top = stack.pop();
                if (c == ')' && top != '(' || c == ']' && top != '[') {
                    return false; 
                }
            }
        }
        return stack.isEmpty();
    }
}
