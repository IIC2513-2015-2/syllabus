function Mamifero(nombre) {
  this.nombre = nombre;
}

Mamifero.prototype.habla = function(veces) {
  while(veces-- > 0) {
    console.log(this.nombre + ": ...");
  }
}

Mamifero.prototype.camina = function() {
  console.log(this.nombre + " está caminando");
}


function Perro(nombre, raza) {
  Mamifero.call(this, nombre);
  this.raza = raza;
}

Perro.prototype = new Mamifero(null);
Perro.prototype.constructor = Perro;

Perro.prototype.habla = function(veces) {
  while(veces-- > 0) {
    console.log(this.nombre + ": Woof!");
  }
}

var p = new Perro("Snoopy", "Beagle");

p.habla(3);
p.camina();
