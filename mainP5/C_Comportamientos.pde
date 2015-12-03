public void c1(ProcLinea c1, ProcLinea c2, ProcLinea c3, ProcLinea c4, 
ProcLinea c5, ProcLinea c6, boolean dir) {
  c1.animar(int(300/control_int), dir);
  if (sop > 134) {
    c2.animar(int(300/control_int), dir);
    c3.animar(int(300/control_int), dir);
  }
  if (sop > 140) {
    c4.animar(int(300/control_int), dir);
  }
  if (sop > 150) {
    c5.animar(int(300/control_int), dir);
    c6.animar(int(300/control_int), dir);
  }
}

public void c2(ProcLinea c1, ProcLinea c2, ProcLinea c3, ProcLinea c4, 
ProcLinea c5, ProcLinea c6) {
  if (contador < 120) {
    if (sopDist < 0) {
      c1.animar(3, false);
      c2.animar(3, false);
      c3.animar(3, false);
      c4.animar(3, false);
      c5.animar(3, false);
      c6.animar(3, false);
    } else if (sopDist > 0) {
      c1.animar(1, true);
      c2.animar(2, true);
      c3.animar(1, true);
      c4.animar(2, true);
      c5.animar(1, true);
      c6.animar(2, true);
    } else if (sopDist == 0) {
      c1.animar(4, false);
      c2.animar(4, false);
      c3.animar(4, false);
      c4.animar(4, false);
      c5.animar(4, false);
      c6.animar(4, false);
    }
  }
}

public void c3(ProcLinea c1, ProcLinea c2, ProcLinea c3, ProcLinea c4, 
ProcLinea c5, ProcLinea c6, int i) {
  if (frameCount % i == 0) {
    c1.opa = 255;
    c2.opa = 255;
    c3.opa = 255;
    c4.opa = 255;
    c5.opa = 255;
    c6.opa = 255;
  } else {
    c1.opa = 0;
    c2.opa = 0;
    c3.opa = 0;
    c4.opa = 0;
    c5.opa = 0;
    c6.opa = 0;
  }

  c1.animar(2, false);
  c2.animar(1, false);
  c3.animar(2, false);
  c4.animar(2, false);
  c5.animar(1, false);
  c6.animar(1, false);
}

public void c4(ProcLinea c1, ProcLinea c2, ProcLinea c3, ProcLinea c4, 
ProcLinea c5, ProcLinea c6, boolean dir, int p) {
  c1.opa = 255;
  c2.opa = 255;
  c3.opa = 255;
  c4.opa = 255;
  c5.opa = 255;
  c6.opa = 255;

  c1.animar(p, dir);
  c2.animar(p, dir);
  c3.animar(p, dir);
  c4.animar(p, dir);
  c5.animar(p, dir);
  c6.animar(p, dir);
}

