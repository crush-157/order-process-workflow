require 'temporalio/activity'

module OrderProcess
  class ShipGoods < Temporalio::Activity::Definition
    def execute(order)
      Interface::Shipping.ship(
        order.items, order.recipient, order.shipping_address
      )
    end
  end
end