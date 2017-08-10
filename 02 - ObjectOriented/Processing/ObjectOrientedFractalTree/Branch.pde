class Branch {
  PVector begin;
  PVector end;
  boolean finished = false;
  
  Branch(PVector _begin, PVector _end) {
    begin = _begin;
    end = _end;
  }
  
  void show() {
    stroke(255);
    line(begin.x, begin.y, end.x, end.y);
  }
  
  Branch branchR() {
    PVector dir = PVector.sub(end,begin);
    dir.mult(0.67);
    dir.rotate(PI/4);
    PVector newEnd = PVector.add(end,dir);
    Branch right = new Branch(end,newEnd);
    return right;
  }
  Branch branchL() {
    PVector dir = PVector.sub(end,begin);
    dir.mult(0.67);
    dir.rotate(-PI/4);
    PVector newEnd = PVector.add(end,dir);
    Branch left = new Branch(end,newEnd);
    return left;
  }
}