// shape and geometry releated code
// including Shape, Rectangle, Ellipse
// AABB, Geometry

// Axis Aligined bounding box 
class AABB {
  
}

interface Shape {
  public void render();
}

class Rectangle implements Shape {
  public int x;
  public int y;
  public int w;
  public int h;
  public Rectangle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void render() {
    rectMode(CORNER);
    rect(x, y, w, h);
  }
}

class Ellipse implements Shape {
  public int x;
  public int y;
  public int w;
  public int h;
  public Ellipse(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void render() {
    ellipseMode(CENTER);
    ellipse(x,y,w,h);
  }
}

class Geometry {
  public final ArrayList<Shape> shapes;
  public Boolean hasError = false;
  public Geometry(ArrayList<Shape> shapes) {
    this.shapes = shapes;
  }
  
  public void render() {
    if(hasError){
      return;
    }
    for(Shape shape : shapes){
      shape.render();
    }
  }
  
  public int x;
  public int y;
  public int w;
  public int h;
}
