public class ProcLinea {
  boolean avanza, reco;
  int cuadro, cuadro_2, vel, x, y, px;
  int anchoSheet, altoSheet, xSheet, ySheet, anPx;
  float opa;
  PImage sheet;
  PImage[] sprites;

  ProcLinea(PImage imagen, int px_, int x_, int y_, boolean reco_) {

    sheet = imagen;
    px = px_;
    x = x_;
    y = y_;
    reco = reco_;

    //-----------------------------------------

    avanza = true;
    opa = 255; //Opacidad

    if (reco) {
      anPx = (int)sheet.width/px;
      sprites = new PImage[anPx-1];
      anchoSheet = sheet.width/(anPx);
      altoSheet = sheet.height;    
      xSheet = anchoSheet * 1;       

      for (int i = 0; i < sprites.length; i++) {
        sprites[i] = sheet.get(xSheet, ySheet, anchoSheet, altoSheet);
        xSheet = xSheet + anchoSheet;
      }
    } else {
      anPx = (int)sheet.height/px;
      sprites = new PImage[anPx-1];
      anchoSheet = sheet.width;    
      altoSheet = sheet.height/(anPx);    
      ySheet = altoSheet * 1;       

      for (int i = 0; i < sprites.length; i++) {
        sprites[i] = sheet.get(xSheet, ySheet, anchoSheet, altoSheet);
        ySheet = ySheet + altoSheet;
      }
    }
  }

  public void animar(int vel_, boolean av_) {
    vel = vel_;
    avanza = av_;

    cuadro = avSprites(anPx-1, cuadro, vel, avanza);

    //---------------------------------------------------

    pushMatrix();
    pushStyle();
    tint(255, opa);
    if (reco) {
      translate(x+cuadro*px, y);
    } else {
      translate(x, y+cuadro*px);
    }
    image(sprites[cuadro], 0, 0);
    popStyle();
    popMatrix();
  }
}

