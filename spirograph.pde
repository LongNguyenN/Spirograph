Electron[] cloud;
int numElecs = 6;

void setup() {
  size(400,400);
  cloud = new Electron[numElecs];
  for(int i = 0; i < numElecs; i++) {
    cloud[i] = new Electron(i*PI);
  }
  //setRrRho(180,140,70); //5 petal lotus
  //setRrRho(180,240,60); //5 petal daisy
  //setRrRho(130,140,70); //??
  for(int i = 0; i < cloud.length; i++) {
    cloud[i].setRrRho(5,3,5); //hypotrochoid
  }
}

void draw() {
  //background(155);
  for(int i = 0; i < cloud.length; i++) {
    cloud[i].show();
  }
}

class Electron {
  float x = 0;
  float y = 0;
  float t = 0;
  float speed = 1.0/16;
  int xorigin = 200;
  int yorigin = 200;
  int R = 75;
  int r1 = -25;
  int rho = -85;
  int rColor = 255;
  
  Electron(float t) {
    this.t = t;
  }
  
  void setRrRho(int _R, int _r1, int _rho) {
    R = _R;
    r1 = _r1;
    rho = _rho;
  }
  
  void spirograph(float inc, int scale) {
    t += inc;
    x = scale * ( (R-r1) * cos(t) + rho * cos( (R-r1) * t / r1 ) ) + xorigin;
    y = scale * ( (R-r1) * sin(t) + rho * sin( (R-r1) * t / r1 ) ) + yorigin; 
  }
  
  void hypotrochoid(float inc, int scale) {
    t += inc;
    x = scale * ( (R-r1) * cos(t) + rho * cos( (R-r1) * t / r1 ) ) + xorigin;
    y = scale * ( (R-r1) * sin(t) - rho * sin( (R-r1) * t / r1 ) ) + yorigin;
  }
  
  void show() {
    if(t < r1 / (R-r1)) {
      hypotrochoid(speed, 10);
      fill(255, 0, 0);
      ellipse(x,y,10,10);
    } else {
      fill(255, 0, 0);
      ellipse(x,y,10,10);
      hypotrochoid(speed, 10);
      fill(0, 255, 0);
      ellipse(x,y,10,10);
    }
  }
}
