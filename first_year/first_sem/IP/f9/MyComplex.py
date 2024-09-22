import math
class MyComplex:
    def __init__(self,num,denum):
        self.re=float(num)
        self.img=float(denum)
        
    def __str__(self):
        if self.re==0 and self.img==0:
            return 0
        elif self.re==0:
            return self.img+"i"
        elif self.img==0:
            return self.re
        elif self.img<0 and self.re>0:
            return "%d - %d i" % (self.re,abs(self.img))
        elif self.re<0 and self.img>0:
            return "- %d + %d i" % (abs(self.re),self.img)
        elif self.img<0 and self.re<0:
            return "- %d - %d i" % (abs(self.re),abs(self.img))
        else:
            return "%d + %di" % (self.re,self.img)
    
    def __eq__(self,other):
        return self.re==other.re and self.img==other.img
    
    def __abs(self):
        return (self.re**2+self.img**2)/2
        
    def __neg__(self):
        return MyComplex(-self.re,-self.img)
    
    def __add__(self,other):
        return MyComplex(self.re+other.re,self.img+other.img)
    
    def __sub__(self,other):
        return MyComplex(self.re-other.re,self.img-other.img)
  
    def __mul__(self, other):
        real=(self.real*other.real)-(self.imag*other.img)
        img=(self.imag*other.real)+(self.real*other.img)
        return MyComplex(real, img)
    
    def __truediv__(self,other):
        if other.real==0 and other.img==0:
            raise ZeroDivisionError("Cannot divide by zero")
        elif other.real==0:
            real=0
            img=0
        else:
            denom=(other.real**2)+(other.img**2)
            real=((self.real*other.real) + (self.img*other.img))/denom
            img=((self.img*other.real) - (self.real*other.img))/denom
        return MyComplex(real, img)
    
    def inverse(self):
        if self.real == 0 and self.imag == 0:
            raise ZeroDivisionError("Cannot divide by zero")
        return MyComplex((self.re/(math.sqrt((self.re)**2+(self.img)**2))),(-self.img/(math.sqrt((self.re)**2+(self.img)**2))))
    
    def conjugate(self):
        return MyComplex(self.re,-self.img)
    
    def get_real(self):
        return self.re
    
    def get_img(self):
        return self.img
    
    def set_real(self,a):
        self.re=a
        
    def set_img(self,b):
        self.img=b
        
    def str2complex(s):
        real=0
        img=0
        try:
            if "+" in s:
                parts=s.split("+")
                real=float(parts[0])
                img=float(parts[1][:-1])
            elif "-" in s:
                parts=s.split("-")
                real=float(parts[0])
                img=-float(parts[1][:-1])
            else:
                real=float(s[:-1])
        except:
            raise ValueError("Invalid input")
        return MyComplex(real, img)