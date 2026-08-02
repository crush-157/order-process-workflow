require 'temporalio/activity'

module OrderProcess
  class CheckInventory < Temporalio::Activity::Definition
    def execute(items)
      Interface::Inventory.check(items)
    end
  end
end