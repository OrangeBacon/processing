class GeometryParser {
  ArrayList<Shape> shapes = new ArrayList<Shape>();
  Boolean errored = false;
  String[] code;
  int line = 0;
  
  public GeometryParser(String[] code){
    this.code = code;
  }
  
  public Geometry parse() {
    for(; line < code.length; line++) {
      parseLine(code[line]);
    }
    Geometry geo = new Geometry(shapes);
    geo.hasError = errored;
    return geo;
  }
  
  private void parseLine(String line) {
    String[] parts = split(line, ' ');
    if(parts.length <= 0 || parts[0].length() <= 0) {
      return;
    }
    
    switch(parts[0].charAt(0)){
      case ' ':
      case '\t':
      case '\r':
      case '\n': break;
      case '#':
        break;
      case 'r':
        parseRect(parts);
        break;
      case 'e':
        parseEllipse(parts);
        break;
      default:
        println("[warn] unknown command at line", line, parts[0]);
        errored = true;
        break;
    }
  }
  
  private void parseRect(String[] parts) {
    if(parts.length != 5){
      println("[warn] bad rectangle at line", line, "(missing/extra arguments)");
      errored = true;
      return;
    }
    try {
      shapes.add(new Rectangle(parseInt(parts[1]), parseInt(parts[2]), parseInt(parts[3]), parseInt(parts[4])));
    } catch(Exception e) {
      println("[warn] bad rectangle at line", line, "(number parse failed)");
      errored = true;
    }
  }
  
  private void parseEllipse(String[] parts) {
    if(parts.length != 5){
      println("[warn] bad ellpise at line", line, "(missing/extra arguments)");
      errored = true;
      return;
    }
    try {
      shapes.add(new Ellipse(parseInt(parts[1]), parseInt(parts[2]), parseInt(parts[3]), parseInt(parts[4])));
    } catch(Exception e) {
      println("[warn] bad ellipse at line", line, "(number parse failed)");
      errored = true;
    }
  }
}
