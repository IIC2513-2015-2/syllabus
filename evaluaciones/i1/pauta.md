# Pauta Interrogación 1

## Ejercicio 1

Cada una de las siguientes preguntas vale 1 punto.

### Pregunta 1
Explica el concepto de *convention over configuration* y da 3 ejemplos de cómo se aplica en Rails.

#### Respuesta

Como el nombre lo sugiere, se prefiere seguir convenciones entre los desarrolladores en vez de definir opciones de configuración. El objetivo es disminuir la cantidad de desiciones que se deben tomar y la cantidad de elementos a especificar, simplificando el desarrollo y reduciendo la cantidad de código a escribir.

Algunos ejemplos en Rails:

* Al crear un modelo, su tabla en la base de datos tiene su nombre en plural y con `snake_case`.
* Al momento de definir un modelo `User`, disponemos de `users` (su forma plural) para referirnos a los controllers o vistas.
* Las acciones de un controlador (`controller`) siguen la convención de estar asociadas a las vistas dentro de la carpeta `views` / `<Nombre del controlador>` / `<acción>`.
* Las `join_tables` entre dos modelos se reconocerán automáticamente si su nombre secontiene ambos modelos en order alfabético, en plural y separadas por un guión bajo. Ejemplo: para `User` y `House` sería `houses_users`.
* En las `routes`, cada acción HTTP asociada a un recurso (`resources` o `resource`) va asociada a un método CRUD del controlador.
* Cuando se crean relaciones entre modelos, la *foreign key* de los modelos relacionados se declaran como `<nombre_modelo>_id`.

### Pregunta 2
¿Qué es MVC y cómo se aplica en Rails?

#### Respuesta

**Model View Controller** es un patrón de arquitectura de software.

Rails es un framework para construir aplicaciones web siguiendo el patrón MVC. Permite crear fácilmente todos los elementos de este patrón (modelo, vista y controlador) y contiene los "pegamentos" para unirlos y hacerlos funcionar.


### Pregunta 3

Son las 4A.M. y con tanto estudio para esta prueba te pones a soñar que te conviertes en ¡un computador que actuá de servidor Web!

Tienes instalada una aplicación Rails que permite revisar un listado de especies de escarabajo y luego, mediante un link, ver una página con el detalle de un escarabajo en particular.

Todo estaba tranquilo hasta que, de pronto, un usuario se dispone a cargar esa lista y luego hacer clic en el primer escarabajo. En ese momento, todo pasa a verse en *"cámara lenta"* en tu sueño.

Describe, en detalle, desde tú perspectiva como servidor Web, qué sucede con esta interacción del usuario, paso a paso. Mantente sobre el nivel TCP/IP (Internet), pero sé detallista, incluyendo lo que sucede *"dentro"* de la aplicación Rails.

#### Respuesta

1. El cliente estableció una conexión TCP/IP conmigo.
1. El cliente comenzó a enviarme un *request* HTTP. Es un GET al recurso *escarabajos* para obtener el listado.
1. Cuando se interpreta el *request*, el *router* determina, de acuerdo al método HTTP utilizado y path solicitado, qué *controller* y *action* (método, finalmente) de ese *controller* se encargará de generar la respuesta.
1. El método llamado del *controller* se ejecuta y genera un resultado HTML. Ese resultado lo envío como respuesta HTTP de vuelta al cliente.
1. Cuando el usuario hace clic para ver el detalle de un escarabajo en particular, todo el proceso comienza de nuevo y es muy similar, salvo que esta vez el path es diferente. Por lo tanto, el *router* hace que se ejecute un *controller* y *action* diferente, el que se encarga de mostrar el recurso "escarabajo de id X", que genera una respuesta HTML diferente.


### Pregunta 4

El gran logro inicial de la Web fue darnos la posibilidad de dejar disponibles en Internet documentos estáticos “linkeables” entre sí de manera que cualquier computador conectado a esta red pudiese obtenerlo y desplegarlo al usuario final.

Hoy en día, usando básicamente la misma infraestructura, podemos dejar disponibles a todo el mundo verdaderas aplicaciones, que ya no tienen mucho que enviadarle a sus contrapartes “nativas” (o “de escritorio”).

Pero esto no sucedió de la noche a la mañana... explica cómo ocurrió esta evolución, incluyendo una mención y pequeña explicación de los estándares y tecnologías involucrados.

#### Respuesta

* Inicialmente la Web comenzó básicamente con los estándares HTTP, que permitía una comunicación entre cliente (normalmente un browser) y servidor, HTML para representar los documentos que se transferían desde el servidor al cliente, y URLs para poder representar la ubicación de estos documentos.
* Posteriormente estos servidores fueron capaces de ejecutar programas o scripts para generar el contenido a entregar al cliente de manera dinámica, lo que marcó el inicio de las aplicaciones Web. Inicialmente partió con tecnologías como CGI para luego dar paso a los documentos activos (scripts Perl, PHP, ASP, etc) y finalmente el desarrollo de arquitecturas MVC orientadas a la Web, que permitieron realizar aplicaciones mucho más complejas.
* Por otra parte en esta evolución, surgieron las tecnologías CSS, para separar los estilos gráficos de los documentos, y JavaScript, que permitió que el contenido dinámico no sólo se generara desde el servidor sino que pudiera ser creado en el lado del cliente.


### Pregunta 5

En el contexto de Ruby, explica los usos que tiene el concepto de módulo (module). Da un ejemplo de cada uno con código.

#### Respuesta

Los módulos son colecciones de métodos y constantes. La gracia de éstos es que podemos:

* usarlos directamente como conjunto de métodos utilitarios:

  ```ruby
  module Files
    def self.create(name):
      # ...
    end
  end
  ```

* incluirlos en clases para utilizarlos como *mixins*:

  ```ruby
  module Repository
    def clone(url):
      # ...
    end
  end
    
  class Student
    include Repository
    # ...
  end
  ```
    
* utilizarlos para crear *namespaces*:

  ```ruby
  module Classroom
    class Student
    end
  end
  
  Classroom::Student.new
  ```

### Pregunta 6

En Ruby, ¿qué es un símbolo y cuál es su importancia?

#### Respuesta

Son como *strings*, pero inmutables.

Es una manera de declarar constantes y asegurarnos que no van a ser cambiadas en tiempo de ejecución. Esto puede ser útil para usarlas como *keys* de *Hashes*, por ejemplo.

Permiten obtener una optimización similar de memoria que se obtiene en otros lenguajes con strings inmutables: reutilizar el mismo objeto en todos los contextos en que se requiere, en lugar de crear uno nuevo cada vez.

## Ejercicio 2

### Problema 1
Escribe una clase `MathSequence`, cuyo constructor recibe el nombre de una
serie numérica y además tiene un método `traverse`, que dado un número `n`
permite recorrer los primeros `n` números de esa serie y ejecutar código para
cada número y su índice.
Las series soportadas son las de Fibonacci (1, 1, 2, 3, 5, …), Cuadradros
(1, 4, 9, 16, …) y los números triangulares (1, 3, 6, …, (n×(n+1)/2)).
Tu clase debe poder usarse de la siguiente manera

```ruby
seq = MathSequence.new(:fibonacci)
seq.traverse(100) do |i, number_i|
  puts "El #{i}-ésimo número es #{number_i}"
end
```

#### Pauta
Usa solución **propuesta** se encuentra en el archivo [`ej2_1.rb`](ej2_1.rb)

Ítems a evaluar y distribución de puntaje

* **1 pts.** Determinar correctamente la secuencia a ejecutar.
* **2 pts.** Escribir método `traverse` que acepte un bloque.
  * 1.2 pts. Por escribir correctamente cada secuencia (0.4 pts. por secuencia).
  * 0.8 pts. Por llamar correctamente al bloque en cada secuencia.

### Problema 2

Crea una clase `Person` que tenga atributos para nombre, apellido, edad, y sexo;
todos ellos se especifican sólo al momento de construir un objeto, pero sus
valores pueden leerse de manera pública. Luego crea una clase `Hero`, que
hereda de `Person`, y que tiene las siguientes características adicionales:

* un atributo que representa el listado de "superpoderes" (cada uno representado
  simplemente como un símbolo). Un `Hero` es creado, inicialmente, sin
  superpoderes.
* un atributo que represente su nombre de súper héroe (se especifica, junto con
  los atributos de personas, al momento de construcción).
* un método para agregar un nuevo superpoder.
* un método que recibe un superpoder y que, si está disponible en su lista de
  superpoderes, lo utiliza (mostrando algo en consola simplemente).
  Pero si el superpoder no está disponible, debe lanzar la excepción
  `IDontHaveThatPowerException`.
* que dos héroes se puedan sumar (`hero1 + hero2`) y que el resultado de esa
  suma sea un nuevo súpero héroe que tenga una combinación de ambos (lo que
  pasa con los atributos de persona queda a tu critierio).

#### Pauta

Una solución **propuesta** se encuentra en el archivo [`ej2_1.rb`](ej2_2.rb)

Ítems a evaluar y distribución de puntaje

* **1 pts.** Definir clase `Person`
  * 0.5 pts. por constructor con atributos
  * 0.5 pts. por permitir sólo lectura de atributos
* **2 pts.** Definir clase `Hero`
  * 0.2 pts por atributo que representa superpoderes
  * 0.3 pts por construcción (atributo nombre, ejecutar constructor
    de la clase padre)
  * 0.5 pts por método para agregar un nuevo superpoder.
  * 0.5 pts por método que usa un superpoder y lanza excepción
  * 0.5 pts por método que suma un nuevo héroe.

## Ejercicio 3: partiendo con Rails

### Pregunta 1

Explica de manera corta como funciona el sistema de _migraciones_ de Rails y escribe una migración para representar a la entidad Universidad, que tiene los atributos nombre, url (de su sitio web), si es o no estatal y la cantidad de alumnos que posee. Detalla cómo quedará la tabla de la base de datos luego de ejecutarla.

####Pauta

Una migración en Rails es una operación basada en _scripts_ Ruby que permite pasar la base de datos de un estado a otro. Permite que la base de datos **migre** de un **estado consistente** a otro, manteniendo registros de los cambios. Funciona **ejecutando métodos `up` (ejecutado al migrar), `down` (ejecutado ante un _rollback_), y `change` (fusión de las anteriores)**, que modifican la base de datos. El sistema de migraciones lleva un registro de qué migraciones se han aplicado mediante el *timestamp* de cada una, con el fin de poder determinar cuáles están pendientes por ser ejecutadas.

* 1.5 puntos: correcta definición del _cómo_ funciona una migración.

La migración para representar la entidad `Universidad` queda de la siguiente manera:

```ruby
class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.boolean :isState, default: true
      t.integer :number_of_students

      t.timestamps null: false
    end
    add_index :universities, :name, unique: true
  end
end
```

* 1.5 puntos
  * 0.5 por estructura general (clase, herencia, y método `change`)
  * 1 punto por _mapping_ correcto de los atributos.

_Nota: las validaciones de nulidad o los defaults no son exigidos, así como tampoco lo es el detalle de agregar un índice único._

### Pregunta 2

Escribe una clase `ActiveRecord` para trabajar con la tabla anteriormente creada, incluyendo validaciones para:

* nombre: no puede estar en blanco, y debe tener al menos 3 caracteres.
* url: debe ser de la forma `www.<letras o números>.<entre 2 y 5 letras>`.


####Pauta

La clase `ActiveRecord` para la Universidad queda de la siguiente manera:

```ruby
class University < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :url, presence: true, format: /www\.[a-z0-9]+\.[a-z]{2,5}/
end
```

* 3 puntos
  * 1 punto por clase y herencia
  * 1 punto por cada validación.
  
Nota: _Se considera flexibilidad con el manejo correcto de las formalidades de Rails._
