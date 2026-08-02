require 'temporalio/activity'

module Mocks
  class MockProcessPayment < Temporalio::Activity::Definition
    activity_name: ProcessPayment

    def execute(payment_details)
      Interface::PAYMENT_CONFIRMATION
    end
  end
end