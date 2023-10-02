# Patrones de diseño

Integrantes:  
- Acuña Napan, Jaime Gonzalo
- Zuñiga Chicaña, Alejandra Aztirma

# Patrones de diseño

## Descripción de la aplicación

Nuestra aplicación es un sistema de pedidos de comida en línea que ofrece diferentes tipos de restaurantes para los clientes. Los restaurantes pueden tener diferentes tipos de menús y opciones de entrega. Los clientes pueden realizar pedidos y realizar pagos en línea. La aplicación utiliza los siguientes patrones de diseño:

### Factory Method Pattern

Hemos implementado el patrón Factory Method para crear objetos de restaurantes. Tenemos una clase abstracta **`Restaurant`** que define un método abstracto **`create_menu`** que las subclases deben implementar. Las subclases como **`ItalianRestaurant`** y **`MexicanRestaurant`** implementan este método y crean menús específicos para sus respectivos tipos de restaurantes

```ruby

class Restaurant
  def create_menu
    raise NotImplementedError, "Las subclases deben implementar create_menu"
  end
end

```


### Bridge Pattern

El Patrón Bridge es un patrón de diseño estructural que utilizamos para separar la abstracción de su implementación. Esto significa que dividimos una clase en dos jerarquías independientes: una para la abstracción y otra para la implementación. Esto nos brinda flexibilidad y extensibilidad.

```ruby
class Menu
  attr_reader :delivery

  def initialize(delivery)
    @delivery = delivery
  end

  def display_menu
    raise NotImplementedError, "Las subclases deben implementar display_menu"
  end
end
```

En nuestro caso, la abstracción se refleja en la clase **`Menu`**, que representa la idea general de un menú de restaurante.

#### **Implementación en Código**

Nuestra implementación comienza con la clase **`Menu`**, que tiene una propiedad **`delivery`** que representa la implementación de entrega. **`Menu`** define un método abstracto **`display_menu`** que debe implementarse en las subclases.

```ruby

class ItalianMenu < Menu
  def display_menu
    "Menú italiano:\n" + @delivery.deliver
  end
end

class MexicanMenu < Menu
  def display_menu
    "Menú mexicano:\n" + @delivery.deliver
  end
end

```

Luego, tenemos subclases concretas como **`ItalianMenu`** y **`MexicanMenu`**, que implementan **`display_menu`** específicamente para menús italianos y mexicanos, respectivamente.

#### **Implementación de Entrega**

Para la implementación de entrega, comenzamos con la clase abstracta **`Delivery`**, que define el método abstracto **`deliver`**.

```ruby
class Delivery
  def deliver
    raise NotImplementedError, "Las subclases deben implementar deliver"
  end
end

```

Luego, creamos subclases concretas como **`HomeDelivery`** y **`PickupDelivery`** para proporcionar implementaciones específicas de entrega, como "Entrega a domicilio" y "Recoger en el restaurante".

```ruby

class HomeDelivery < Delivery
  def deliver
    "Entrega a domicilio"
  end
end

class PickupDelivery < Delivery
  def deliver
    "Recoger en el restaurante"
  end
end

```

Este diseño nos permite separar claramente la abstracción de la implementación, lo que facilita la extensión del sistema sin afectar las clases existentes.
### Command Pattern

Utilizamos el patrón Command para manejar los pedidos y las acciones relacionadas con ellos. Tenemos una clase **`Order`** que toma un comando (como **`PlaceOrderCommand`**) y ejecuta acciones como realizar el pedido y procesar el pago.

```ruby

class Order
  def initialize(command)
    @command = command
  end

  def execute_order
    @command.execute
  end
end

class PlaceOrderCommand
  def initialize(menu)
    @menu = menu
  end

  def execute
    "Pedido realizado para:\n" + @menu.display_menu
  end
end

```

Con estos patrones de diseño, hemos logrado una aplicación más modular y flexible para gestionar pedidos de comida en línea con diferentes tipos de restaurantes, menús y opciones de entrega.
