require 'temporalio/activity'

module Mocks
  class MockShipGoods < Temporalio::Activity::Definition
    activity_name: ShipGoods

    def execute(order)
      {
        courier: Interface::COURIER,
        tracking_number: Interface::TRACKING_NUMBER
      }
    end
  end
end