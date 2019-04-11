Geometry x;

void setup() {
  size(500, 500);
  x = new GeometryParser(loadStrings("geometry.txt")).parse();
  background(127);
  x.render();
}

void draw() {
  if(mousePressed) {
    x = new GeometryParser(loadStrings("geometry.txt")).parse();
    background(127);
    x.render();
  }
} //<>//
