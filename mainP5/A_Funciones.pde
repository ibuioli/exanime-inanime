public int avSprites(int numCuadros, int cuadro, int vel, boolean dire) {
  if (vel != 0) {
    if (frameCount % vel == 0) {
      if (dire) {
        cuadro++;
      } else {
        cuadro--;
      }
    } else {
      cuadro = cuadro * 1;
    }
  } else if (vel == 0) {
    cuadro = cuadro;
  }

  if (dire) {
    if (cuadro == numCuadros) {
      cuadro = 0;
    }
  } else {
    if (cuadro <= 0) {
      cuadro = numCuadros - 1;
    }
  }

  return cuadro;
}

///////CONTROL SENSORES//////

public void deControl() {
  if (temp >= 8500) {
    temp = 2000;
  }
}

///////RESET///////

public void reseteador() {
  control_int = (int)constrain(control, 1, 300);
}

/////////PRUEBA/////////

public void prueba(ProcLinea c1, ProcLinea c2, ProcLinea c3, ProcLinea c4, 
ProcLinea c5, ProcLinea c6, boolean dir) {
  c1.opa = 255;
  c2.opa = 255;
  c3.opa = 255;
  c4.opa = 255;
  c5.opa = 255;
  c6.opa = 255;

  c1.animar(int(1), dir);
  c2.animar(int(1), dir);
  c3.animar(int(2), dir);
  c4.animar(int(1), dir);
  c5.animar(int(1), dir);
  c6.animar(int(2), dir);
}

//////////////////////////

