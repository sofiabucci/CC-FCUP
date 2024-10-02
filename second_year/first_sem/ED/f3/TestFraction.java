import java.util.Scanner;

class Fraction {

   int n, d; 

   Fraction(int n,int d){
      n = n;
      d = d;
   }

   public string toString(){
      u = n/d;
      r = n%d;
      return (u + " + " + r + "/" + d)
   }

   public Fraction add(Fraction f){
      Fraction s = new Fraction(0, 0);
      if ( this.d == f.d) {
         s.n = this.n + f.n;
         s.d = this.f + f.d;
      }
      else {
         s.n = (this.n*f.d)+(f.n*this.d);
         s.d = this.d*f.d;
      }

      return s;
   }

   public Fraction multiply(Fraction f){
      Fraction m = new Fraction(f.n*this.n, f.d*this.d);
      return m;
   }
   
   public void simplify(){
      
   }
}

public class TestFraction {
   public static void main(String[] args) {

   }    
}