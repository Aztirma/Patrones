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

Utilizamos el patrón Bridge para separar la abstracción de los restaurantes de su implementación.. En este caso, la abstracción es la clase **`Menu`**, que tiene una implementación específica en las subclases **`ItalianMenu`** y **`MexicanMenu`**. La clase **`Menu`** también tiene una propiedad delivery que puede ser configurada en su constructor. Esto permite separar la idea del menú de la forma en que se entrega (por ejemplo, entrega a domicilio o entrega en el restaurante).

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

class Delivery
  def deliver
    raise NotImplementedError, "Las subclases deben implementar deliver"
  end
end

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
