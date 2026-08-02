require 'temporalio/activity'

module OrderProcess
  class NotifyCustomer < Temporalio::Activity::Definition
    def execute(customer, order_number, tracking_details)
      Interface::Email.notify(customer, order_number, tracking_details)
    end
  end
end