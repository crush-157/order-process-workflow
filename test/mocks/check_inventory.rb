require 'temporalio/activity'

module Mocks
  class MockCheckInventory < Temporalio::Activity::Definition
    activity_name: CheckInventory

    def execute(items)
      Interface::INVENTORY_CHECK
    end
  end
end