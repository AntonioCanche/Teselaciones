PImage ima, ima2, ima3, ima4, ima5;
ArrayList <Figura> figuras;
float lado = 8;
float altura = sqrt(sq(lado) - sq(lado/2f));
float apotema = lado/ 2*tan(PI/6f);
float radio = altura - apotema;
float delta = 0;
void setup()
{
size(1000,700,P3D);
ima = loadImage("Bufanda.jpg");
ima2 = loadImage("oscar.jpg");
ima3 = loadImage("ashes.jpg");
ima4 = loadImage("cara.jpg");
ima5 = loadImage("bugssolid.jpg");


figuras = new ArrayList<Figura>();
for (float j = radio; j<=height; j+= altura){
int paso = (round((j - radio)/altura));
float offset =0;
if (paso%2 == 0){
offset = lado/2f;
}
for (float i =-offset; i<=width; i+= lado){
figuras.add(new Triangulo(i,j,lado,0));
}
for (float i =lado/2f-offset; i<=width; i+= lado){
figuras.add(new Triangulo(i,j-apotema,lado,PI));
}
}

}
void draw()
{



background(0);
noStroke();
fill(0);
for (Figura f: figuras){
f.display();
}
fill(255);
text("Press A",70,550);
pushMatrix();
scale(.1,.1);
translate(400,5600);
image(ima,0,0);
popMatrix();

text("Press S",190,550);
pushMatrix();
scale(.1,.1);
translate(2000,5650);
image(ima2,0,0);
popMatrix();


text("Press D",290,550);
pushMatrix();
scale(.1,.1);
translate(3000,5650);
image(ima3,0,0);
popMatrix();


text("Press F",390,550);
pushMatrix();
scale(.1,.1);
translate(4000,5650);
image(ima5,0,0);
popMatrix();

text("Press G",520,550);
pushMatrix();
scale(.1,.1);
translate(5480,5650);
image(ima4,0,0);
popMatrix();

}
interface Figura
{
float perimetro ();
float area ();
void display();
}
class Triangulo implements Figura
{
float x,y,l,rc,ri,a,a1,deltax,deltay,h,b,rota;
Triangulo (float x_,float y_,float l_, float rota_)
{
x=x_;
y=y_;
l=l_;
rc=(l*sqrt(3))/3f;
b=l;
a1=TWO_PI/3;
rota = rota_;
}
float perimetro ()
{
return l*3;
}
float area ()
{
return ((l*l)*(sqrt(3)))/4;
}
void display()
{

 if (key=='s'){

  color c= ima2.get(int (x), int (y));
fill (c);
pushMatrix();
translate(x,y);
rotate(HALF_PI - PI/3 + rota);
beginShape();
for(float a = 0;a<TWO_PI;a+=a1)
{
deltax=cos(a)*rc;
deltay=sin(a)*rc;
vertex(deltax,deltay);
}
endShape(CLOSE);
popMatrix();

}
  if (key == 'a'){
  color c= ima.get(int (x), int (y));
fill (c);
pushMatrix();
translate(x,y);
rotate(HALF_PI - PI/3 + rota);
beginShape();
for(float a = 0;a<TWO_PI;a+=a1)
{
deltax=cos(a)*rc;
deltay=sin(a)*rc;
vertex(deltax,deltay);
}
endShape(CLOSE);
popMatrix();
  }


if (key == 'd'){
  color c= ima3.get(int (x), int (y));
fill (c);
pushMatrix();
translate(x,y);
rotate(HALF_PI - PI/3 + rota);
beginShape();
for(float a = 0;a<TWO_PI;a+=a1)
{
deltax=cos(a)*rc;
deltay=sin(a)*rc;
vertex(deltax,deltay);
}
endShape(CLOSE);
popMatrix();
  }
  if (key == 'f'){
  color c= ima5.get(int (x), int (y));
fill (c);
pushMatrix();
translate(x,y);
rotate(HALF_PI - PI/3 + rota);
beginShape();
for(float a = 0;a<TWO_PI;a+=a1)
{
deltax=cos(a)*rc;
deltay=sin(a)*rc;
vertex(deltax,deltay);
}
endShape(CLOSE);
popMatrix();
  }
  if (key == 'g'){
  color c= ima4.get(int (x), int (y));
fill (c);
pushMatrix();
translate(x,y);
rotate(HALF_PI - PI/3 + rota);
beginShape();
for(float a = 0;a<TWO_PI;a+=a1)
{
deltax=cos(a)*rc;
deltay=sin(a)*rc;
vertex(deltax,deltay);
}
endShape(CLOSE);
popMatrix();
  }
}
}