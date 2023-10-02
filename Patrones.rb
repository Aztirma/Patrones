# Factory Method Pattern

class Restaurant
    def create_menu
      raise NotImplementedError, "Las subclases deben implementar create_menu"
    end
  end
  
  class ItalianRestaurant < Restaurant
    def create_menu
      ItalianMenu.new
    end
  end
  
  # Bridge Pattern
  
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
      "Pizza, Pasta, Risotto"
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
 
