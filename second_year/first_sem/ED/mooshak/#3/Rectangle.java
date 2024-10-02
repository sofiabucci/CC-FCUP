
class Rectangle {
    Point p1, p2;

    Rectangle(Point p1, Point p2){
        this.p1 = p1;
        this.p2 = p2;
    }
    Rectangle(int x1, int y1, int x2, int y2){
        this.p1 = new Point(x1,y1);
        this.p2 = new Point(x2,y2);
    }

    public int area(){
        return (p2.x-p1.x)*(p2.y-p1.y);
    }

    public int perimeter(){
        return ((p2.x-p1.x)*2 + (p2.y-p1.y)*2);
    }

    public boolean pointInside(Point p){
        if (p.x >= p1.x && p.x <= p2.x && p.y >= p1.y && p.y <= p2.y) return true;
        else return false;
    }

    public boolean rectangleInside(Rectangle r){
        if (pointInside(r.p1) && pointInside(r.p2)) return true;
        else return false;
    }
}
