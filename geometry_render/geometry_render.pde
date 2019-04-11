Geometry x;

void setup() {
  size(500, 500);
  x = new GeometryParser(loadStrings("geometry.txt")).parse();
}

void draw() {
  background(127);
  x.render();
  if(mousePressed) {
    x = new GeometryParser(loadStrings("geometry.txt")).parse();
  }
} //<>//
