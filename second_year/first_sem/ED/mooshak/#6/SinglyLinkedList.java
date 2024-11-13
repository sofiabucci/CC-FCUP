
class SinglyLinkedList<T> {
    private Node<T> first;
    private int size;

    public SinglyLinkedList() {
        first = null;
        size = 0;
    }

    public int size() {
        return size;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public void addFirst(T value) {
        Node<T> newNode = new Node<>(value, first);
        first = newNode;
        size++;
    }

    public void addLast(T value) {
        Node<T> newNode = new Node<>(value, null);
        if (isEmpty()) {
            first = newNode;
        } else {
            Node<T> cur = first;
            while (cur.getNext() != null) {
                cur = cur.getNext();
            }
            cur.setNext(newNode);
        }
        size++;
    }

    public T get(int pos) {
        Node<T> curr = first;
        int i=0;
        while (curr != null) {
            if (i==pos) {
                return curr.getValue();
            }
            curr = curr.getNext();
            i++;
        }
        return null;
    }

    public T getFirst() {
        if (isEmpty()) return null;
        return first.getValue();
    }

    public T getLast() {
        if (isEmpty()) return null;
        Node<T> cur = first;
        while (cur.getNext() != null) {
            cur = cur.getNext();
        }
        return cur.getValue();
    }

    public T remove(int pos) {
        if (pos < 0 || pos >= size) {  
            return null;
        }
    
        if (pos == 0) {  
            T removedValue = first.getValue();
            removeFirst();
            return removedValue;
        }
    
        Node<T> curr = first;
        for (int i = 0; i < pos - 1; i++) { 
            curr = curr.getNext();
        }
        
        T removedValue = curr.getNext().getValue();  
        curr.setNext(curr.getNext().getNext());    
        size--;  
        
        return removedValue;  
    }

    public void removeFirst() {
        if (isEmpty()) return;
        first = first.getNext();
        size--;
    }

    public void removeLast() {
        if (isEmpty()) return;
        if (size == 1) {
            first = null;
        } else {
            Node<T> cur = first;
            for (int i = 0; i < size - 2; i++) {
                cur = cur.getNext();
            }
            cur.setNext(null);
        }
        size--;
    }

    public void removeAll(T value) {
        if (isEmpty()) return;
        int i=0;
        Node<T> curr = first;
        while(curr != null){
            if (curr.getValue().equals(value)){
                remove(i);
                curr= (i==0) ? first : curr.getNext();
            }
            else{
                i++;
                curr = curr.getNext();
            }
        }
    }

    public String toString() {
        StringBuilder str = new StringBuilder("{");
        Node<T> cur = first;
        while (cur != null) {
            str.append(cur.getValue());
            cur = cur.getNext();
            if (cur != null) str.append(",");
        }
        str.append("}");
        return str.toString();
    }

    public int count(T value){
        int count=0;
        Node<T> curr = first;
        while(curr != null){
            if (curr.getValue().equals(value)){
                count ++;
            }
            curr = curr.getNext();
        }
        return count;
    }

    public SinglyLinkedList<T> copy(){
        Node<T> curr = first;
        SinglyLinkedList<T> newList = new SinglyLinkedList<>();
        while(curr != null){
            newList.addLast(curr.getValue());
            curr = curr.getNext();
        }
        return newList;
    }

    public void duplicate(){
        Node<T> curr = first;
        while(curr != null){
            Node<T> newNode = new Node<>(curr.getValue(),curr.getNext());
            curr.setNext(newNode);
            size++;
            curr = newNode.getNext();
        }
    }
    
}




