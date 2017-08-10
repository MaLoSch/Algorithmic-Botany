ArrayList<Branch> tree = new ArrayList<Branch>();

void setup() {
  size(500, 500);
  
  PVector a = new PVector(width/2, height);
  PVector b = new PVector(width/2, height-100);
  Branch root = new Branch(a,b);
  
  tree.add(root);
}

void draw() {
  background(0);
  for(int i=0; i<tree.size(); i++) {
    tree.get(i).show();
  }
}

void mousePressed() {
  for(int i=tree.size()-1; i>=0; i--) {
    if(!tree.get(i).finished) {
      tree.add(tree.get(i).branchR());
      tree.add(tree.get(i).branchL());
      tree.get(i).finished = true;
    }
  }
}