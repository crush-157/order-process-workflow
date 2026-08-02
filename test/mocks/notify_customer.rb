require 'temporalio/activity'

module Mocks
  class MockNotifyCustomer < Temporalio::Activity::Definition
    activity_name: NotifyCustomer

    def execute(customer, order_number, tracking_details)
      "Hi Alfred,\n" \
      "Your order 0000 has been shipped via Random Courier.\n" \
      "Your tracking number is: RC-000000.\n" \
      "Best regards,\nThe Cheese People"
    end
  end
end
