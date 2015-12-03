#define LECTURAS 15

int micPin = 0;

int limite = 1000;
int val = 0;
int leer[LECTURAS];
int index = 0;
int total = 0;
int mic = 0;

int act = 0;

///////////////CONTROL//////////////////
int lim = 135;
int contador;
long control;

void setup() {
  Serial.begin(9600);

  for (int i = 0; i < LECTURAS; i++) {
    leer[i] = 0;
  }

}

void loop() {
  val = analogRead(micPin);

  if (val >= 1) {
    val = constrain(val, 1, limite);
    val = map(val, 1, limite, 1, 999);

    total -= leer[index];
    leer[index] = val;
    total += leer[index];
    index = (index + 1);

    if (index >= LECTURAS) {
      index = 0;
    }

    mic = total / LECTURAS;
  }

  if (mic > lim) {
    contador = 0;
    if (mic > 130 && mic < 140) {
      control += 2;
    } else if (mic > 140 && mic < 150) {
      control += 3;
    } else if (mic > 150 && mic < 160) {
      control += 4;
    }else if (mic > 160) {
      control += 5;
    }
  } else if (mic < lim) {
    contador++;
  }
  if (contador >= 600) {
    control = 0;
    contador = 0;
  }

  Serial.print(mic);
  Serial.print(" ");
  Serial.print("2500");
  Serial.print(" ");
  Serial.println(control);
}
