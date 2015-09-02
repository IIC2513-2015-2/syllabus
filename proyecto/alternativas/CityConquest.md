# CityConquest

Ya cansados de las funcionalidades de Foursquare/Swarm y con ganas de desarrollar una plataforma similar pero con un factor social y competitivo más potente ha nacido el proyecto **CityConquest**.

Este lleva los lugares importantes de una ciudad a un juego de realidad aumentada donde los usuarios deben aliarse en facciones para conquistar su ciudad y posteriormente el mundo.

## Introducción

El proyecto consiste en desarrollar una plataforma donde usuarios del mundo real puedan interactuar entre sí y su ciudad. Posteriormente se deberá desarrollar una API para poder llevar el juego a dispositivos móviles. A continuación encontrarán una descripción de los principales elementos del juego, pero con algunas partes implícita o explícitamente abiertas u opcionales que podrán decidir en su implementación.

### Facciones y usuarios

Este es un juego que consiste en **crear o unirse a facciones** que controlan parte de la ciudad donde se desarrolla el juego. Para esto se declaran lugares importantes de una ciudad que se considerarán como **puntos de interés** que pueden ser conquistados (y arrebatados) a medida que usuarios de una misma facción comienzan a visitarlo.

Estos **puntos de interés** pueden ser, por ejemplo:

* Estaciones de Metro
* Universidades o colegios
* Monumentos o museos
* Etcétera...

Con respecto a las facciones., éstas deben declararse pertenecientes a una sola ciudad. Pueden ser creadas por usuarios que serán sus administradores, quienes podrán controlar la membresía de ésta, que puede ser del tipo:

* *Abierta*: cualquiera puede unirse.
* *Privada*: requiere confirmación.
* *Cerrada*: requiere invitación y confirmación del invitado.

Se debe poder agregar comentarios y _likes_ a los lugares. Los lugares con más interacción deben ser considerados como _más valiosos_.

Debe ser posible que los administradores tengan la opción de migrar su facción a otra ciudad. Es desicion del desarrollador ver qué pasa con sus lugares conquistados y sus usuarios.

Los administradores de las **facciones** pueden declarar lazos de amistad con otras facciones. En tales casos, durante la disputa de los lugares, se considerarán como fuerzas aliadas en la conquista (ver [Puntos y captura](#puntos-y-captura)).

También es posible declarar a otras facciones como **enemigas**. Por defecto todas las facciones son **neutrales** hasta que alguna de ellas intente arrebatar el dominio de un lugar de la otra.

Los usuarios no administradores se llamarán los **adherentes**. Éstos pueden ser ascendidos a **administrador** o ser expulsados. Estos usuarios pueden pertenecer a múltiples facciones **siempre y cuando no existan lazos de enemistad entre ellas**. Queda a decición del implementador ver qué sucede cuando un usuario es adherente a dos facciones que acaban de declararse enemigas.

Un usuario que pase a ser **administrador** de una facción, debe dejar de ser **adherente** de toda otra facción.

Los usuarios y las facciones deben tener páginas con su información, foto de perfil y comentarios.

### Puntos y captura

La metodología del juego consiste en ayudar en la captura de los lugares mediante _**check-ins**_. Al inicio de un juego en una ciudad, todos los lugares parten como neutrales.

Un lugar debe requerir una mínima cantidad de _check-ins_ para ser capturado (puede ser constante para todos o depender de ciertos parámetros del lugar). Es decición del implementador el algoritmo para los casos de disputa (por ejemplo: _la facción con el 51% o más de los check-ins totales del lugar se lleva el dominio_). Recordar que lugares con mayor interacción son más valiosos.

Todos los usuarios que participaron de la captura se llevan un puntaje. Los usuarios adherentes a la facción vencedora que no hayan participado se llevan una parte menor del puntaje.

Se debe controlar que un usuario no pueda hacer _check-in_ dos veces en un mismo lugar en el mismo día. Además **mediante el uso de una API** comprobar que los tiempos entre _check-ins_ de dos lugares distintos sean realistas. Por ejemplo: no se debe poder hacer _check-in_ en un extremo de la ciudad y al segundo siguiente hacerlo en el otro extremo.

Se deben entregar bonificaciones si durante la captura se adjuntan fotos o videos del lugar.

### Ítems

Los puntos adquiridos pueden ser canjeados por ítems que deben permitir mejorar el aporte a la captura de un lugar. Adicionalmente podría tener efectos sobre la repartición del puntaje o en los tiempos de viaje entre _check-ins_.

Pueden existir items exclusivos (con *stock* limitado) con atributos especiales o mejores que los típicos.

Se debe poder intercambiar ítems y lugares entre los usuarios. El intercambio de lugares solo se puede realizar si se es administrador de una facción dueña del lugar.

#### Ítems secretos

Pueden existir ítems que puedan ser desbloqueados dada ciertas interacciones de un usuario. Por ejemplo, *haber participado en la conquista de todos los museos desbloqua un item especial.*

### Alcalde

Para que una ciudad pueda ser incluida en el juego, se requiere de un **Alcalde** que se encargue de declarar los puntos de interés de la ciudad. Esta entidad es un usuario que no puede ser participante de ninguna facción. Sólo puede haber un alcalde por ciudad.

#### Votaciones

Entre los administradores de las facciones pueden realizarse votaciones para revocar los permisos de un alcalde y convertir al ganador de la votación en el nuevo alcalde, quien perderá dominio de su facción.

# Funcionalidad secundaria

* Permitir a los usuarios iniciar sesión o crear cuenta.
* Leaderboards con información de los lugares mejor valorados, las mejores facciones y los jugadores más entusiastas, etc.
* Opcional: Incorporar una vista de Google maps o similar en la página.
