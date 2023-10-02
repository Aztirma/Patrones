# Factory Method Pattern

class Restaurant
    def create_menu
      Menu.new
    end
  end
  
  class ItalianRestaurant < Restaurant
    def create_menu
      ItalianMenu.new
    end
  end
  
  class MexicanRestaurant < Restaurant
    def create_menu
      MexicanMenu.new
    end
  end
  
  # Bridge Pattern
  
  class Menu
    attr_reader :delivery
  
    def initialize(delivery = nil)
      @delivery = delivery
    end
  
    def display_menu
      "Menú genérico"
    end
  end
  
  class ItalianMenu < Menu
    def display_menu
      "Pizza Margherita, Pasta Carbonara, Tiramisu"
    end
  end
  
  class MexicanMenu < Menu
    def display_menu
      "Tacos, Quesadillas, Guacamole"
    end
  end
  
  # Command Pattern
  
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
  
  # Clase principal Main
  
  class Main
    def self.run
      # Crear una instancia de un restaurante italiano
      italian_restaurant = ItalianRestaurant.new
  
      # Crear el menú del restaurante italiano
      menu = italian_restaurant.create_menu
  
      # Crear una instancia de entrega a domicilio
      delivery = HomeDelivery.new
  
      # Crear un comando para realizar un pedido con el menú
      order_command = PlaceOrderCommand.new(menu)
  
      # Crear una orden utilizando el comando de pedido
      order = Order.new(order_command)
  
      # Imprimir mensajes informativos
      puts "Bienvenido al restaurante italiano."
      puts "Menú disponible:"
      puts menu.display_menu
      puts "Realizando pedido..."
      puts order.execute_order
      puts "Entrega seleccionada: #{delivery.deliver}"
    end
  end
  
  # Ejecutar la aplicación
  Main.run
  