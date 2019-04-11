// shape and geometry releated code
// including Shape, Rectangle, Ellipse
// AABB, Geometry

// Axis Aligined bounding box 
class AABB {
  public int x;
  public int y;
  public int w;
  public int h;
  public AABB(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public String toString(){
    return "<x = " + x + ", y = " + y + ", w = " + w + ", h = " + h + ">";
  }
}

interface Shape {
  public void render();
  public AABB bounds();
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
  
  public AABB bounds() {
    return new AABB(x,y,w,h);
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
  
  public AABB bounds() {
    return new AABB(x-w/2,y-h/2,w,h);
  }
}

class Geometry implements Shape {
  public final ArrayList<Shape> shapes;
  public Boolean hasError = false;
  public Geometry(ArrayList<Shape> shapes) {
    this.shapes = shapes;
  }
  
  public void render() {
    if(hasError){
      return;
    }
    AABB bound = bounds();
    rect(bound.x, bound.y, bound.w, bound.h);
    for(Shape shape : shapes){
      shape.render();
    }
  }
  
  public AABB bounds(){
    if(shapes.size() <= 0){
      return new AABB(0,0,0,0);
    }
    AABB bound = new AABB(0,0,0,0);
    AABB box = shapes.get(0).bounds();
    bound.x = box.x;
    bound.y = box.y;
    bound.w = box.w;
    bound.h = box.h;
    for(Shape shape : shapes) {
      box = shape.bounds();
      println(bound, box);
      if(box.x + box.w > bound.x + bound.w){ //<>//
        bound.w = box.x + box.w - bound.x;
      }
      if(box.y + box.h > bound.y + bound.h){
        bound.h = box.y + box.h - bound.y;
      }
      if(box.x < bound.x){
        bound.w -= bound.x - box.x;
        bound.x = box.x;
      }
      if(box.y < bound.y){
        bound.h += bound.y - box.y;
        bound.y = box.y;
      }
    }
    println(bound);
    return bound;
  }
}
