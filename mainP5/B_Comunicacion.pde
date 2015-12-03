public void oscEvent(OscMessage mensaje) {
  if (mensaje.checkAddrPattern("/sop")==true) {
    sop = mensaje.get(0).intValue();
  } else if (mensaje.checkAddrPattern("/temp")==true) {
    temp = mensaje.get(0).intValue();
  } else if (mensaje.checkAddrPattern("/control")==true) {
    control = mensaje.get(0).intValue();
  }
}
