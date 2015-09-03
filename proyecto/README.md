# Proyecto Semestral

La asignación de proyectos por equipo es la siguiente:

| Equipo   | Proyecto  |
|:---------|:----------|
| LosExtraterrestresMusicales | [SongFlow](alternativas/SongFlow.md) |
| Rupie | Save me Sensei |
| TheTeam | ApUntate |
| Veritas | La Resistencia |
| YisusPlusOne | [CityConquest](alternativas/CityConquest.md) |
| ImaginApp | Carpooling |
| Nebuchadnezzar | Linked On |
| Rock and Prog | [SongFlow](alternativas/SongFlow.md) |
| InternalServerError | B-Movies |
| String.random | [Alma](alternativas/Alma.md) |
| ihjgbvoiik | [CityConquest](alternativas/CityConquest.md) |
| PW:Software | [SongFlow](alternativas/SongFlow.md) |
| ToPa | [Alma](alternativas/Alma.md) |
| tqzptscsaj | [CityConquest](alternativas/CityConquest.md) |

Durante el semestre tendrán que realizar 6 entregas, y cada una irá construyendo sobre la anterior, por lo que es importante mantenerse al día. Los enunciados dan la línea general de funcionalidad que deben implementar, pero serán deliberadamente ambiguos de manera que ustedes usen su creatividad para crear una aplicación realmente única. Salvo algunos casos, ustedes tendrán total libertad en cuanto a la interfaz y la implementación de su trabajo.

A continuación, las fechas y enunciados de las entregas:

* [Entrega 1](entregas/Entrega1.md): 16 de septiembre de 2015 a las 23:59:59.999

## Indicaciones

* Todo el código será entregado únicamente a través de un repositorio Git alojado en [Github](https://github.com). Nosotros les proveeremos repositorios gratuitos y privados, para lo cual deberán enviarnos el username con el que están registrados en Github (o [registrarse](https://github.com/join) si es que no lo están aún) y el nombre de su equipo, que servirá como nombre de repositorio.

* Los ayudantes revisarán el branch master únicamente, por lo que es recomendable que usen otras ramas durante el desarrollo y realicen merge a master sólo de lo que están seguros de querer entregar.

* Para alojar sus aplicaciones en Internet, la plataforma soportada y recomendada será [Heroku](https://www.heroku.com/). Si desean utilizar otro proveedor, pueden hacerlo pero **bajo su propia responsabilidad**. El resultado final esperado es que ustedes tengan que realizar un *deploy* real de su aplicación en modo producción y que ésta quede disponible para cualquier usuario de Internet. No cumplir con ello implicará un castigo en la evaluación.

* Para evaluar cada entrega, **ambos** miembros del equipo tendrán una reunión **presencial** de corrección con el ayudante que se les haya asignado. La no asistencia (salvo justificación de peso) de alguno o ambos integrantes implicará nota mínima en esa entrega.

* El avance logrado en cada entrega se evaluará en base a lo mostrado en Heroku en el momento de la reunión con el ayudante y a lo subido al repositorio Github en la fecha límite de la entrega.

* Las entregas se evaluarán según la siguiente escala:
	* Nota A: Muy buen trabajo. Avance mayor del solicitado.
	* Nota B: Buen trabajo. En línea con la exigencia.
	* Nota C: Regular. Un poco bajo el avance esperado.
	* Nota D: Malo. Muy por debajo de lo solicitado.

## Restricciones

* La aplicación debe desarrollarse en Ruby 2.1 o superior y Rails 4.2 o superior.

* Deberán usar HTML, CSS y JavaScript.
	* Como librería JavaScript, podrán usar jQuery.
	* Está permitido el uso de HAML o Slim en lugar de HTML de manera directa.
	* Podrán usar SASS (pero en el sabor SCSS únicamente) en lugar de CSS. Código CSS válido es también SCSS válido.
	* **NO está permitido** el uso de lenguajes que compilen a JavaScript, como CoffeeScript. La idea es que aprendan a programar en JavaScript… incluso si luego en otros proyectos prefieren usar CoffeeScript, el saber JavaScript les será de mucha utilidad. Por esto, les recomendamos que, apenas creen su proyecto Rails, eliminen la gema coffee-rails de su Gemfile antes de hacer algo más. Así evitarán que se generen archivos coffee.
	* Tampoco podrán usar librerías de componentes HTML/CSS/JS como Twitter Bootstrap o Zurb Foundation, salvo una que otra excepción (aquí deberán consultar en el [foro](https://github.com/IIC2513-2015-2/syllabus#foro)). Pero si quieren, ¡vean su código fuente y úsenlos de inspiración!
	* Cualquier gema o plugin JavaScript adicional que quieran usar debe ser aprobado por el equipo docente. Revisen [la Wiki](https://github.com/IIC2513-2015-2/syllabus/wiki/Gemas) y pregunten a través del [foro del curso](https://github.com/IIC2513-2015-2/syllabus#foro) si tienen dudas.

## Recomendaciones

* Comiencen con una interfaz de usuario (UI) simple; no es necesario que su aplicación se vea “bonita” desde el comienzo.

* Para la primera entrega deberán crear *mockups* (dibujos/prototipos) de su aplicación. La idea es que las utilicen en las entregas siguientes.

* Escriban su código Ruby/JavaScript **en inglés**. Así se ahorrarán muchos problemas y sacarán el máximo provecho de las convenciones. La interfaz de su aplicación puede estar en inglés o en español.

* Rails provee lo que se llama scaffolding, que les crea una implementación muy básica y cruda para los distintos recursos de su aplicación. Salvo para las primeras entregas, les recomendamos no usar scaffolds, ya que lograrán una mejor y mayor comprensión de los distintos componentes de Rails.

## Dudas
Para que todo el curso se vea beneficiado, hagan sus preguntas sobre el material del curso, sobre tecnologías web, y sobre el proyecto a través del [foro del curso](https://github.com/IIC2513-2015-2/syllabus#foro).  No se responderá ninguna duda del proyecto por e-mail.
