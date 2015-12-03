//
//AV2 - Todavia Sin Título - Código P5
//Barabino Federico - Buioli Ignacio
//
//P5 vr 2.2.1+
//2015
//

import oscP5.*;
import netP5.*;

OscP5 puerto;

ProcLinea[] r01 = new ProcLinea[6];
ProcLinea[] r02 = new ProcLinea[6];
ProcLinea[] r03 = new ProcLinea[6];
ProcLinea[] r04 = new ProcLinea[6];
ProcLinea[] r05 = new ProcLinea[6];
ProcLinea[] r06a = new ProcLinea[6];
ProcLinea[] r06b = new ProcLinea[6];
ProcLinea[] r07 = new ProcLinea[6];
ProcLinea[] r08 = new ProcLinea[6];
ProcLinea[] r09 = new ProcLinea[6];
ProcLinea[] r10 = new ProcLinea[6];
ProcLinea[] r11 = new ProcLinea[6];
ProcLinea[] r12 = new ProcLinea[6];
ProcLinea[] r13 = new ProcLinea[6];
ProcLinea[] r14 = new ProcLinea[6];
ProcLinea[] r15 = new ProcLinea[6];
ProcLinea[] r16 = new ProcLinea[6];
ProcLinea[] r17 = new ProcLinea[6];
ProcLinea[] r18 = new ProcLinea[6];
ProcLinea[] r19 = new ProcLinea[6];
ProcLinea[] r20 = new ProcLinea[6];
ProcLinea[] r21 = new ProcLinea[6];
ProcLinea[] r22 = new ProcLinea[6];
ProcLinea[] r23 = new ProcLinea[6];
ProcLinea[] r24 = new ProcLinea[6];
ProcLinea[] r26 = new ProcLinea[6];
ProcLinea[] r27a = new ProcLinea[6];
ProcLinea[] r27b = new ProcLinea[6];
PImage[] imgs = new PImage[27];
int sop, temp, contador;
int limite = 131;
int control_int, pSop, tmpAmb;
byte sopDist;
int tmpDist, r;
float opacidad, ang;
long control;

long dep; //Depuración, Eliminar Luego
float depi;

public void setup() {
  size(768, 768);
  noSmooth();

  //Grafico//
  background(0);
  noCursor();
  noStroke();

  //Comunicacion//
  puerto = new OscP5(this, 12001);

  //Cargar Datos//
  for (int i = 0; i < imgs.length; i++) {
    imgs[i] = loadImage("i"+nf(i+1, 2)+".png");
  }

  for (int i = 0; i < 6; i++) {
    boolean t;
    if (i % 2 == 0) {
      t = true;
    } else {
      t = false;
    }
    r01[i] = new ProcLinea(imgs[0], (int)random(1, 3), 2, 457, t);
    r02[i] = new ProcLinea(imgs[1], (int)random(1, 3), 498, 531, t);
    r03[i] = new ProcLinea(imgs[2], (int)random(1, 3), 21, 83, t);
    r04[i] = new ProcLinea(imgs[3], (int)random(1, 3), 351, 532, t);
    r05[i] = new ProcLinea(imgs[4], (int)random(1, 3), 526, 622, t);
    r06a[i] = new ProcLinea(imgs[5], (int)random(1, 3), 648, 623, t);
    r06b[i] = new ProcLinea(imgs[5], (int)random(1, 3), 648, 524, t);
    r07[i] = new ProcLinea(imgs[6], (int)random(1, 3), 142, 69, t);
    r08[i] = new ProcLinea(imgs[7], (int)random(1, 3), 191, 106, t);
    r09[i] = new ProcLinea(imgs[8], (int)random(1, 3), 337, 87, t);
    r10[i] = new ProcLinea(imgs[9], (int)random(1, 3), 393, 85, t);
    r11[i] = new ProcLinea(imgs[10], (int)random(1, 3), 14, 165, t);
    r12[i] = new ProcLinea(imgs[11], (int)random(1, 3), 82, 157, t);
    r13[i] = new ProcLinea(imgs[12], (int)random(1, 3), 208, 623, t);
    r14[i] = new ProcLinea(imgs[13], (int)random(1, 3), 315, 626, t);
    r15[i] = new ProcLinea(imgs[14], (int)random(1, 3), 10, 73, t);
    r16[i] = new ProcLinea(imgs[15], (int)random(1, 3), 437, 130, t);
    r17[i] = new ProcLinea(imgs[16], (int)random(1, 3), 97, 482, t);
    r18[i] = new ProcLinea(imgs[17], (int)random(1, 3), 112, 605, t);
    r19[i] = new ProcLinea(imgs[18], (int)random(1, 3), 407, 618, t);
    r20[i] = new ProcLinea(imgs[19], (int)random(1, 3), 513, 737, t);
    r21[i] = new ProcLinea(imgs[20], (int)random(1, 3), 497, 77, t);
    r22[i] = new ProcLinea(imgs[21], (int)random(1, 3), 505, 270, t);
    r23[i] = new ProcLinea(imgs[22], (int)random(2, 4), 216, 214, t);
    r24[i] = new ProcLinea(imgs[23], (int)random(1, 3), 255, 170, t);
    r26[i] = new ProcLinea(imgs[25], (int)random(1, 3), 303, 131, t);
    r27a[i] = new ProcLinea(imgs[26], (int)random(1, 3), 101, 171, t);
    r27b[i] = new ProcLinea(imgs[26], (int)random(1, 3), 101, 330, t);
  }

  tmpAmb = 2000;
}

public void draw() {
  //////////////////////////////
  pushStyle();
  if (frameCount % 120 == 0) {
    r = (int)random(10, 120);
  }
  if (control < 400) {
    fill(0, 70);
  }
  if (control > 400 && control < 404) {
    fill(255);
  }
  if (control > 404 && control < 406) {
    fill(0);
  }
  if (control > 406 && control < 750) {
    fill(0, map(sop, 132, 150, 130, 10));
  }
  if (control > 750 && control < 810) {
    fill(255, 40);
  }
  if (control > 810 && control < 1200) {
    fill(0, 40);
  }
  if (control > 840 && control < 1200) {
    fill(0, 20);
  }
  if (control > 880 && control < 1200) {
    fill(0, map(sop, 132, 150, 130, 10));
  }
  if (control > 930 && control < 1200) {
    fill(10, 40);
  }
  if (control > 940 && control < 1200) {
    fill(255, 40);
  }
  if (control > 990 && control < 1200) {
    fill(15, 5);
  }
  if (control > 1000 && control < 1200) {
    fill(255, 60);
  }
  if (control > 1030 && control < 1200) {
    fill(0, 30);
  }
  if (control > 1100 && control < 1200) {
    fill(255, 50);
  }
  if (control > 1130 && control < 1200) {
    fill(0, 10);
  }
  if (control > 1200 && control < 1400) {
    if (frameCount % 60 == 0) {
      fill(255, map(sop, limite, 150, 110, 10));
    } else {
      fill(0, map(sop, limite, 150, 110, 10));
    }
  }
  if (control > 1400) {
    if (frameCount % 30 == 0) {
      fill(255, map(sop, limite, 150, 120, 40));
    } else {
      fill(0, map(sop, limite, 150, 130, 40));
    }
  }
  if (control > 1600) {
    if (frameCount % r == 0) {
      fill(0, 200);
    } else {
      fill(255, 30);
    }
  }
  rect(0, 0, width, height);
  popStyle();
  //////////////////////////////

  sopDist = byte(sop - pSop);
  tmpDist = temp - tmpAmb;

  if (control < 1) {
    ang = 0;
  }

  //////////////////////////////

  if (control > 1 && control < 408) {
    com1();
  }
  if (control > 100 && control < 408) {
    com2();
  }
  if (control > 190 && control < 408) {
    com3();
  }
  if (control > 408 && control < 810) {
    com4();
  }
  if (control > 810 && control < 1200) {
    com5();
  }
  if (control > 1200 && control < 1400) {
    mPrueba();
  }
  if (control > 1400) {
    ang += map(sop, 130, 170, map(control, 1400, 3000, 0.75, 2), map(control, 1400, 3000, 5, 7));
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(ang));
    translate(-width/2, -height/2);
    mPrueba();
    popMatrix();
    popStyle();
  }

  //////////////////////////////
  deControl();
  reseteador();
  println("Sop:", sop, "Tmp:", tmpDist, "Con:", control);
  pSop = sop; //Si o si al final del draw()
}

