module Interface 

  class Shipping
    def self.ship(items, recipient, address)
      {
        courier: Interface::COURIER,
        tracking_number: Interface::TRACKING_NUMBER
      }
    end
  end
end