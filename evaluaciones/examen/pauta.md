# Pauta Examen

El enunciado completo del examen se puede ver [aquí](examen.pdf).

## Ejercicio 1 (32%): Preguntas conceptuales

### Pregunta 1 (1 pto)

¿Qué diferencias entre RESTful WS y RPC-Style WS hacen a uno más simple que al otro?

#### Respuesta

Los RESTful son más simples pues:
- La operación, el *scope* y los datos están directamente representados en el mismo protocolo HTTP (con el método, *path* o URL y *body*, respectivamente), no necesitando un nuevo estándar como algún tipo de sobre (SOAP).
- Aunque existe un estándar para la descripción de estos servicios, la mayoría de las veces no se usa pues basta con una simple documentación, a diferencia de WSDL, por ejemplo, en el caso RPC-Style, que es imprescindible para poder utilizarlos.

**Pauta**: 0.5 puntos por cada diferencia, ya sea éstas, similares u otras que también puedan estar correctas.

### Pregunta 2 (1 pto)

¿Cuál es la diferencia entre llamar directamente a una función en JavaScript o entregarla como argumento a la función `$` de jQuery? ¿Dependiendo de qué se debiera usar una u otra forma?

#### Respuesta

Llamar a una función directamente, por supuesto, la ejecuta inmediatamente. Si se le entrega la función como argumento a `$`, esta función no se llamará inmediatamente sino luego de que el evento `DOMContentLoaded` se gatille.

Por lo tanto, será necesario utilizar la segunda forma únicamente cuando queramos que la función se ejecuta sólo después de que el DOM esté completamente cargado en el browser (por ejemplo, porque la función interactuará con el DOM).

**Pauta**: 0.5 puntos por la diferencia, 0.5 puntos por especificar cuándo ejecutar la función a través de `$`.

### Pregunta 3 (1 pto)

Menciona 3 usos útiles que puede tener Ajax y explica en detalle cómo se implementa uno de ellos (en palabras, no código).

#### Respuesta

Usos útiles:
- validación de datos de formulario que requieran información del lado del servidor (ej.: si el *username*/e-mail está ya registrado o no)
- cargar desde el servidor sólo la sección de la página Web que cambia luego de una interacción del usuario en lugar de la página completa
- actualizar datos presentes en una página sin necesidad de refrescar la página completa

Para realizar una validación de unicidad de *username*, tendríamos que:
- crear un *endpoint* en el servidor que reciba un *username* y responda si existe o no, ya sea por un HTTP status o de alguna otra forma interpretable programáticamente (respuesta JSON, por ejmplo)
- escuchar el evento DOM que indique cuándo se debiera validar el *username* (ej. *blur* en el campo de *username*)
- en ese evento, crear un request Ajax al endpoint mencionado y, dependiendo de la respuesta, decidir si mostrar algún error, bloquear el envío del formulario, etc.

**Pauta**: 0.2 puntos por cada uso útil y 0.4 puntos por detallar cómo implementar alguno de ellos. Notar que los ejemplos pueden tender a ser similares dependiendo de qué tan generales/particulares se especifiquen, pero mientras no sean muy similares se considerará correcto.

### Pregunta 4 (1 pto)

Explica una diferencia y una semejanza entre el efecto de usar los métodos `cookies` y `session` en el contexto de Rails.

#### Respuesta

Semejanza: ambos métodos son una especie de Hash de datos que serán almacenados con ayuda de *HTTP cookies*

Diferencia: Cada dato *seteado* con `cookies` será una *HTTP cookie* diferente en el cliente. En cambio, los datos *seteados* con `session` serán todos almacenados en una única *HTTP cookie* de sesión, o incluso ni siquiera en una *HTTP cookie* directamente, dependiendo de la configuración de sesión.

**Pauta**: 0.5 puntos por la semejanza y 0.5 puntos por la diferencia. La respuesta de la pauta es sólo un ejemplo, pues pueden plantearse otras igualmente válidas.

### Pregunta 5 (1 pto)

Imagina que tienes dos aplicaciones Rails instaladas en el mismo dominio pero en distinto path (ej.: `/app1` y `/app2`). ¿Qué condiciones debieran cumplirse para que, habiendo iniciado sesión en una de ellas, al visitar la otra también se muestre con sesión iniciada?

#### Respuesta

Ambas aplicaciones necesitarían, por supuesto, tener los mismos usuarios (o equivalentes) como parte los datos que usa (por ejemplo, ambas aplicaciones usan la misma base de datos o el mismo servicio para cargar el usuario).

Pero además es necesario que ambas aplicaciones entiendan de igual manera los datos de sesión que estén almacenados, directa o indirectamente, en *HTTP cookies*. En la configuración *default*, los datos de, por ejemplo, qué id de usuario es el actualmente identificado, quedan almacenados en una *cookie* de sesión encriptada. Por lo tanto, ambas aplicaciones necesitarían tener la misma información de encriptación de *cookie* de sesión.

**Pauta**: 0.5 puntos mencionar que debieran compartir de alguna forma datos de usuario y 0.5 puntos por mencionar que debieran ambas entender la información de sesión de la misma manera. No es necesario tanto detalle, sino simplemente expresar estas dos ideas.

### Pregunta 6 (1 pto)

En tu experiencia desarrollando una aplicación Web, comenta sobre dos aspectos de dos *estándares Web* diferentes que consideras te han dificultado tu tarea más de lo que debieran. Plantea qué mejora se les podría agregar para resolver esas dificultades. Explica, pero de manera concisa.

#### Respuesta

**Pauta**: Aquí puede haber una infinidad de respuestas válidas. Lo importante es la relación entre lo planteado y su justificación; que tenga sentido y se note un análisis de por medio. Un ejemplo podría ser lo limitada de la sintaxis de CSS (que no posee ni siquiera variables, por ejemplo). Cada dificultad con su mejora propuesta considera 0.5 puntos.

## Ejercicio 2 (34%): Mejorando el formulario para ordenar

### Parte a (2.5 puntos): disminuir información desplegada.

#### Solución

Una posible solución es, tanto al cargar el DOM como cada vez que se cambie el valor del `select`, ocultar todos los `span.price` de cada producto y mostrar sólo el que sea de la clase correspondiente al tamaño seleccionado. Para esto, sólo se necesita agregar el siguiente trozo de código JavaScript en algún archivo que se cargue inicialmente en la página. Por orden, podría ser `app/assets/javascripts/orders.js`.

```js
$(function() {
  var $priceSelector = $('#order_size'),
      $productPrices = $('.product .price');
  function displaySizePrice() {
    var size = $priceSelector.val();
    $productPrices.hide().filter('.' + size).show();
  }
  $priceSelector.on('change', displaySizePrice);
  displaySizePrice();
});
```

#### Pauta

- (0.3 ptos) Realizar filtro por el evento change del select
- (0.2 ptos) Realizar filtro al cargar el DOM
- (0.6 ptos) Identificar el valor del tamaño actual
- (0.7 ptos) Esconder precios que no corresponden al tamaño
- (0.7 ptos) Mostrar precio que corresponde al tamaño

La pauta considera una solución con sólo JS, que sería suficiente. Si la solución es más compleja, mientras cumpla con el requisito de no recargar el formulario aunque sea por Ajax (pues se perderían los datos ingresados) puede también estar correcta. Los ítems de la pauta son más bien generales, para poder ser adaptados a otras posibles soluciones.

### Parte b (3.5 puntos): precios dinámicos.

#### Solución

Una posible solución sería en JavaScript, cada cierto intervalo de tiempo, llamar a una función que haga un *request Ajax* a un endpoint en el servidor que entregue una representación JSON de los productos (o al menos de sus precios) y procesar esa respuesta actualizando el valor HTML de cada `span.price` según corresponda. Así, necesitamos los siguientes cambios:

En `config/routes.rb`

```ruby
resources :products, only: [:index]
```

En `app/controllers/products_controller.rb`, crear el controlador si no existe, pero lo importante es agregar el método `index` y que responda una representación JSON de los productos. Esto es lo mínimo necesario, aunque podríamos crear un serializador, o usar un template Rabl o alguna otra forma de generar la respuesta JSON. Pero dado que, por lo que sabemos, `Product` no contiene ningún dato "privado", puede bastarnos con la transformación JSON default.

```ruby
def index
  products = Product.all
  render json: products
end
```

Y, finalmente, en `app/assets/javascripts/orders.js`:

```js
$(function() {
  setInterval(function() {
    $.get('/products', function(data) {
      // también puede ser con un simple for
      $.each(data, function(index, product) {
        var $prices = $('#product-' + product.id + ' .price');
        $prices.filter('.grande').html('Grande: ' + product.price_grande);
        $prices.filter('.enorme').html('Enorme: ' + product.price_enorme);
        $prices.filter('.gigante').html('Gigante: ' + product.price_gigante);
      });
    });
  }, 60000);
});
```

#### Pauta

Las soluciones pueden ser diversas, pero lo importante es no refrescar el formulario completo (o la página completa) para así no perder los datos ya ingresados por el usuario. Pero en general, debieran realizarse las siguientes tareas:

- (0.7 puntos) Comenzar el proceso de actualización de precios cada 1 minuto.
- (1 puntos) Proveer un *endpoint* en el *backend* que entregue la información necesaria (ruta + controlador + eventual template).
- (0.8 puntos) *Request Ajax* a ese endpoint para obtener la información.
- (1 puntos) Procesar la información que llegó y actualizar la página según esa información.

La pauta considera aspectos generales que debieran ser abordados independiente de la solución. Por ejemplo, otra posible solución sencilla sería tener un endpoint que *renderee* un *partial* sólo con los 3 *span* que contienen los precios, y realizar el reemplazo de esos trozos únicamente.

Otra posibilidad válida sería fundir la parte b con lo pedido en la parte a, y sólo actualizar y mostrar el precio seleccionado actualmente. Sin embargo, esto implicaría tener que realizar también el proceso al cambiar el precio.

## Ejercicio 3 (34%): Implementando el recibo

### Solución

A continuación se muestra una posible solución al ejercicio. Si bien puede haber variaciones, la estructura general no debiera ser muy diferente.

En `config/routes.rb`

```ruby
resources :orders, only: [:new, :create] do # new ya debería haber estado presente
  get :receipt, on: :member
end
```

En `app/controllers/orders_controller.rb`

```ruby
def create
  order = Order.new(order_params)
  product = Product.find(order.product_id)
  if product.send("price_#{order.size}") == order.total
    if order.save
      #### BONUS
      conn = Faraday.new('https://api.canalysis.com')
      conn.post do |req|
        req.url '/dcc/order'
        req.headers['Content-Type'] = 'application/json'
        req.body = order.to_json.to_s
      end
      #### END BONUS
      redirect_to receipt_orders_path
      return
  end
  redirect_to expired_order_path
end

def receipt
  @order = Order.find(params[:id])
end

private
def order_params
  params.require(:order).permit(:size, :product_id, :name, :destination, :total)
end
```

Lo ideal es no *renderear* templates en la acción `create`, pero igual puede ser considerado válido. En este caso, el template del recibo está asociado a la acción *receipt*, así que usaremos el template `app/views/orders/receipt.html.erb`

```html+erb
<div id="receipt">
  <h1>¡Enhorabuena por tu orden, <%= @order.consumer_name %>!</h1>
  <p>Pediste:</p>
  <div class="order">
    <div class="product">
      <div class="name"><%= @order.product.name %></div>
      <div class="size"><%= @order.size.capitalize %></div>
    </div>
    <div class="total">
      <strong>$<%= @order.total %></strong>
    </div>
  </div>
  <p>
    Será despachado a
    <span class="destination"><%= @order.destination %></span>
  </p>
</div>
```

Y finalmente el estilo en el CSS `app/assets/stylesheets/orders.scss`:

```scss
#receipt {
  width: 400px;
  margin: 0 auto;
  h1 {
    text-align: center;
  }

  .order {
    border: 1px solid black;
    border-radius: 10px;
    padding: 10px;
    .product {
      display: inline-block;
      width: 75%;
      vertical-align: middle;
      border-right: 1px solid #000;
      .name {
        font-weight: bold;
        font-size: 20px;
      }
    }
    .total {
      display: inline-block;
      font-size: 30px;
      vertical-align: middle;
    }
  }
  .destination {
    background: #000;
    color: #fff;
  }
}
```

#### Pauta

La pauta de esta pregunta es completamente funcional, por lo que es bastante detallada. En una evaluación escrita, por supuesto, no se puede esperar eso. Sin embargo, sí es exigible que se exprese una clara idea de la solución correcta, aunque tenga algunas impresiciones o pequeños errores.

- (0.5 puntos) Creación de la ruta para procesar el formulario y, opcionalmente, para el recibo (opcionalmente pues igual es válido, aunque no ideal, *renderear* el recibo en la misma acción `create`).
- (2 puntos) acción `create` (y `receipt`) en el controlador
  - (1 puntos) validación de total vs precio actual del producto
  - (0.8 puntos) redirección o render según corresponda
  - (0.2 puntos) considerar *strong parameters* al crear la orden
- (1.5 puntos) template de *receipt*
  - (0.8 puntos) código HTML "razonable" (sin elementos relacionados a representación gráfica, con clases/id para identificar algunos elementos relevantes, etc.)
  - (0.7 puntos) ERb relacionado a la orden
- (2 puntos) Estilos CSS
  - (0.5 puntos) posicionamiento y tamaños de elementos
  - (0.5 puntos) colores/negritas/tamaños de fuente
  - (0.5 puntos) bordes, márgenes, paddings
  - (0.5 puntos) uso de selectores y estructura de reglas adecuados