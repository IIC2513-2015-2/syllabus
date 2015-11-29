# Pauta Interrogación 3

## Ejercicio 1 (32%): Preguntas conceptuales

### Pregunta 1 (1.2 puntos)

Explica cómo funciona el *scope* en JavaScript.

#### Solución

El *scope* de JavaScript no se crea por bloques de código, sino por funciones; es decir, una variable declarada dentro de una función (con la *keyword* `var`), aún cuando haya sido declarada dentro de un bloque (un bloque `if`, por ejemplo), será accesible en todo el contexto de la función, incluyendo funciones declaradas dentro de la función original ("scope padre"), pero no fuera de ella.

### Pregunta 2 (1.2 puntos)

Imagina que ya cuentas con un formulario que actualiza los datos de un cierto recurso de tu aplicación hecha en Rails, y ahora quieres incluir el asociar un archivo subido por el usuario a ese recurso, en el mismo formulario. Comenta sobre los cambios que tendrías que realizar en tu aplicación para lograr el objetivo (no es necesario que escribas código, tan sólo cuenta qué harías y dónde).

#### Solución

Los cambios necesarios son:
* Agregar al modelo del recurso el atributo que representa al archivo
* Agregar a la vista (por ejemplo, en el partial `_form`) del recurso la etiqueta `input` correspondiente al atributo (asegurarse que sea `multipart: true`)
* Manejar los datos recibidos en el controlador, es decir, recuperar el objeto desde los parámetros `params` que contiene los datos del archivo subido, incluyendo su contenido. En la acción (en este caso `update` o `create`) se puede especificar el *path* del archivo a guardar, abrir un archivo en modo de escritura y escribir los datos recibidos. Finalmente se cierra el archivo.

El último paso puede ser enormemente simplificado utilizando una gema como *paperclip*, en donde debemos configurar el atributo que representará el archivo en el modelo, ejecutar una migración de utilizando un helper de la misma gema, e incluir el `input` apropiado en la vista. En el controlador tan sólo bastará con asegurarse de incluir el parámetro entre los permitidos (*strong parameters*).

### Pregunta 3 (1.2 puntos)

Aunque tengas una validación de formato para el ingreso de un correo electrónico por parte de tus usuarios, eso no te garantiza que ese dato ingresado sea un e-mail real o que el usuario efectivamente tenga acceso a esa cuenta de correo. Explica cómo podrías tener certeza de lo anterior, especificando el proceso que realizaría tu aplicación Web y usuario.

#### Solución

Para tener certeza se podría agregar un proceso de validación de correo electrónico, siguiendo los siguientes pasos:

* Al registrar el usuario, marcar el correo como no confirmado.
* Generar un Hash único y guardarlo en un modelo que relacione [Usuario, Hash, Correo Electrónico] (puede ser el mismo modelo `User`).
* Enviar un correo al email a validar incluyendo una URL a una ruta específica que contenga el Hash como parámetro.
* Al recibir un request en la ruta específica, obtener el usuario y correo electrónico asociado a partir del Hash y marcarlo como confirmado (esto indica que el correo es real, aunque se puede pedir que el usuario esté logueado para tener aún mayor seguridad).
* Opcionalmente se puede implementar expiración, es decir, si no se recibe ningún request en un tiempo escogido, eliminar el modelo.

### Pregunta 4 (1.2 puntos)

¿Cómo se puede tener un dato *privado* para un objeto en JavaScript? Explica apoyándote con un pequeño ejemplo en código.

#### Solución

Para tener un dato privado para un objeto, se puede crear como variable local de la función constructora. Así será parte del scope de la función constructora y estará disponible para los métodos del objeto creados dentro de la función constructora pero no estará disponible para funciones declaradas fuera de ella.

##### Ejemplo

En el siguiente ejemplo el dato `created` puede ser leído y editado sólo por la función ´age´, pero no puede ser accesido directamente desde fuera de la función constructora.

```js
function Alert() {
  var created = Date.now();
  this.age = function() {
    var seconds = Math.floor((Date.now() - created) / 1000);
    console.log('This alert is '+ seconds +' seconds old.');
  };
}

var myAlert = new Alert();
myAlert.age();
setTimeout(function(){myAlert.age();}, 2000); // 2 segundos de antigüedad
setTimeout(function(){myAlert.age();}, 10000); // 10 segundos de antigüedad
console.log(myAlert.created); // tendrá valor undefined
```

### Pregunta 5 (1.2 puntos)

Si JavaScript no tiene clases (en el contexto de OOP), ¿cómo es posible que tenga herencia? Explica.

#### Solución

Es posible porque está basado en prototipos. Cuando se llama una propiedad del objeto y éste no la tiene, se busca en el prototipo del objeto y, de no encontrarla ahí, en el prototipo del prototipo y así sucesivamente.

Una función constructora puede construir sus objetos con un un objeto creado por otra función como sus prototipos, de esa forma heredando sus propiedades.

## Ejercicio 2

### Problema

#### Parte a (2 puntos)

La variable anchors contiene un arreglo con todos los elementos DOM representando los anchors (links) del documento, en el orden que estos aparecen desplegados al usuario. Considerando esto, un aprendiz de JavaScript escribió el siguiente código, con el objetivo de que cada vez que el usuario haga click en un botón se muestre una alerta indicando el numero de botón al que se le hizo click.

```js
var anchors = [...] // esto viene dado, no se puede cambiar

for (var i = 0; i < anchors.length; i++) {
  $(anchors[i]).on('click', function() {
    alert('Hiciste click en el link número' + i);
  });
}
```

Sin embargo, al ejecutarlo se dio cuenta de que no le funcionó como esperaba. Indica cuál fue el problema con el que se encontró y cómo es posible solucionarlo, mostrando en código la solución correcta.

#### Solución

Lo que sucede con el método es que al hacer click en cualquier _link_, siempre alerta que fue en el número `anchors.length`. Esto se debe a que el _callback_ del `on` contiene la **variable** `i` en su *closure*, no su valor; luego, cuando se ejecuta el _callback_, el valor al que será evaluada la variable `i` será aquél que posee en **ese momento** la variable, o sea, el valor final luego de terminar el _loop_ (`anchors.length`).

Una posible solución es crear un _closure_ que contenga la declaración del _callback_, y que reciba **el valor** que en esa iteración tiene la variable `i` en una nueva variable (ahora local dentro de esa nueva función). De este modo, cuando varía `i` fuera del _closuse_, ésta nueva variable no se verá afectada.

```js
var anchors = [...];
for (i = 0; i < anchors.length; i++) {
  $(anchors[i]).on('click', (function(index) {
    return function() {
      alert('Hiciste click en el link número' + index);
    };
  })(i));
}
```
_(1 punto por correcta explicación de por qué no funciona como se espera, 1 punto por solución que funcione)_.

#### Parte b (4 puntos)

Escribe el codigo JavaScript que debiera ejecutarse previamente para que el siguiente fragmento funcione como se indica en sus comentarios.

```js
//crea un libro con su título, autor y cantidad de páginas
var book1 = new Book (’The Hobbit ’, ’J.R.R. Tolkien ’, 366);
var book2 = new Book (’Foundation ’, ’Isaac Asimov ’, 256);
console.log(book1.getCurrentPage()); // muestra 0
book1.read(150);
console.log(book1.getCurrentPage()); // muestra 150
book1.read(70);
console.log(book1.getCurrentPage()); // muestra 220
book1.read(1000);
console.log(book1.getCurrentPage()); // muestra 366
book2.read(128);
// la línea siguiente mostrará en consola
// "Foundation de Isaac Asimov, 50% leído"
// usando los datos del libro al momento de llamar a la función.
book2.report();
console.log(book1.report === book2.report); // muestra true
// los datos de los libros no pueden ser modificados directamente
// mediante asignaciones de propiedades (ej. book1.title = ’other’)
```
#### Solución
Una posible solución es la siguiente:

```js
function Book(title, author, numberOfPages) {
  var currentPage = 0;

  this.getCurrentPage = function() {
    return currentPage;
  };

  this.getTitle = function() {
    return title;
  };

  this.getAuthor = function() {
    return author;
  };

  this.getNumberOfPages = function() {
    return numberOfPages;
  };

  this.read = function(pages) {
    currentPage += pages;
    if (currentPage > numberOfPages) {
      currentPage = numberOfPages;
    }
  };

  Book.prototype.report = function() {
    var percentage = (this.getCurrentPage() / this.getNumberOfPages()) * 100;
    console.log(this.getTitle() + " de " + this.getAuthor() + ", " + percentage + "% leído.");
  };
}
```

- 0.6 puntos por función constructora, con argumentos
- 1 punto por atributos privados como variables locales, con sus respectivos _getters_
- 0.8 puntos por método read privilegiado y correcta interacción con sus atributos
- 0.8 puntos por método report definido en _prototype_ y correcto acceso a atributos con getters
- 0.8 puntos por correctitud de los cuerpos de las funciones

## Ejercicio 3

### Problema

Tienes un formulario de registro en el que, entre otros campos, hay uno para ingresar un nombre de usuario. Escribe el **código JavaScript** necesario para que, una vez que el usuario cambie el foco del teclado a otro campo (ya sea presionando la tecla `Tab` o haciendo clic en otro campo), se gatille una validación de unicidad (es decir, que no exista otro nombre de usuario ya asociado a alguna cuenta en la base de datos). Si ya existe un nombre de usuario con el mismo valor ingresado por el usuario, debes mostrar un mensaje de error al lado del campo de texto.

Solo es necesario que escribas **código JavaScript**. Sin embargo, si necesitas algún supuesto sobre el documento *HTML*, *CSS* o *backend* (en Rails) que sea relevante para que tu solución funcione, debes declararlo (sin escribir código, solo mencionarlo en palabras).

*Tip*: Cuando el foco del teclado cambia de un campo a otro, se gatilla el evento `blur` en el campo que pierde el foco, y el evento focus en aquel que obtiene el foco del teclado.

### Solución
Esta es una posible solución, pero existen muchas otras válidas.

Suponemos:
* En el HTML hay un `form` con un `input` de tipo `text` con `id="username"`.
* En el HTML hay un `div` tal que `id="existing-user-error"` y que contiene un mensaje avisando que el username está ya estaba registrado, pero tiene estilo `display: none` para que no se vea inicialmente.
* En el _backend_ existe una ruta `GET /users/:username`. Retorna un *status code* `200` si existe el usuario o `404` en caso contrario. Suponemos además que soporta requests que pidan contenido JSON o bien no genere cuerpo en la respuesta (y así no recibir HTML que no utilizaremos).

```js
// es importante hacer esto lugo de DOMContentLoaded, para asegurarnos de que los elementos que necesitamos ya estén creados
$(function() {
  var $existingUsernameMsg = $('#existing-user-error');
  $('#username').on('blur', function(e) {
    var username = $(this).val();
    // comenzamos ocultando el mensaje para sólo mostrarlo si el error aplica
    $existingUsernameMsg.hide();
    $.get("/users/" + username + ".json", function() {
      // esta función sólo se llama en caso de éxito (status 200, por ejemplo, pero no 404)
      $existingUsernameMsg.show();
    });
  });
});
```

#### Distribución Puntaje
| Requerimiento | Puntaje |
|------|---------|
| Correcta subscripción al evento `blur` del campo | 1,0 pts |
| Obtener el valor ingresado | 1.0 pts |
| Correcta llamada al servidor (`GET`) por medio de AJAX | 1.5 pts |
| Manipulación de la respuesta y display de la alerta para el caso de fracaso | 1.5 pts |
| Declaración de los supuestos necesarios | 1.0 pts |
