# SongFlow

Hoy en día la música está al alcance de todos, pero paradójicamente nos cuesta mucho descubrir nueva música que realmente nos guste. Si bien plataformas como Spotify o Apple Music pueden recomendarnos buenas canciones, muchas veces un amigo que te conoce bien sabe perfectamente la canción que te va a gustar y quiere compartir esa pieza de música especial contigo.

SongFlow, como su nombre lo sugiere, es un proyecto en el que los usuarios pueden hacer fluir la música hacia personas que realmente la van a apreciar, y que a su vez la harán fluir hacia sus amigos que saben que buscan escuchar algo así también, creando así un flujo musical que pueda llegar a dar la vuelta al mundo.

## Detalles

La aplicación consiste en una plataforma que permite a un usuario "hacer fluir" música hacia sus amigos. El usuario puede publicar una canción, video musical, álbum, banda de música o noticia relacionada a la música, ya sea a través de algún servicio web que permita buscar lo que quieres compartir o ingresando todos los detalles, incluyendo un link externo si corresponde y categorías/tipos/géneros de música a las que pertenece, directamente. Luego el usuario podrá seleccionar a uno o más de sus amigos y enviarles la publicación realizada para que la puedan disfrutar.

La aplicación también te permitirá automatizar estos flujos de música mediante la creación de grupos de difusión (a los cuales se les pueda ir sumando gente posteriormente) y mediante la creación de ciertos conjuntos de criterios que gatillarán un envío automático de lo que publiques a ciertos amigos o grupos. Estos criterios pueden ser género músical, artista, etc. de manera de poder filtrar finamente qué música harás fluir automaticamente y a quiénes.

## Funcionalidad principal

Las funcionalidad principal y básica del proyecto se especifica a continuación. Cabe decir que esto puede ser personalizado y extendido, siempre y cuando se cumpla el requisito de cada entrega.

* Usuarios pueden crear publicaciones musicales, que pueden consistir en una **canción**, **álbum**, **banda musical**, **noticia relacionada a la música**, etc. Éstas formarán parte del *timeline* de ese usuario.
* Los usuarios pueden establecer relaciones de amistad entre sí.
* Los usuarios pueden compartir sus publicaciones explícitamente con otros usuarios o grupos de usuarios.
* Los usuarios pueden crear grupos de amigos, que pueden ser:
	* ***invite only***: son grupos de difusión a los que solo puede acceder un usuario al haber sido invitado a unirse.
	* **públicos**: son grupos abiertos a todo el mundo a los que los usuarios pueden decidir unirse para ir recibiendo todas las publicaciones que se envíen a través de éste.
* Los grupos públicos pueden tener categorías a definir, como por ejemplo artistas, géneros musicales, país, etc., que luego permitan filtrarlos y operar con ellos. Por ejemplo, se puede permitir la búsqueda de grupos a los cuales unirse o sugerir a usuarios la pertenencia a ciertos grupos a los cuales ya pertenecen sus amigos o que pertenecen a categorías de interés (basta con que sean recomendaciones básicas, no se espera un motor de recomendaciones muy elaborado).
* Funcionalidad para artistas: se deja abierta la posibilidad de incluir funcionalidad específica para usuarios que a su vez, sean artistas, pertenezcan a una banda o sean productores.
* Se deja abierta la posibilidad de crear flujos de música transitivos: Si un usuario recibe una publicación (ya sea porque le fue compartida directamente o fue compartida a un grupo al cual pertenece) ésta podría ser directamente compartida a sua amigos u otros grupos a los que este usuario esté actualmente compartiendo de manera automatizada (mediante los conjuntos de criterios que tenga creados).
