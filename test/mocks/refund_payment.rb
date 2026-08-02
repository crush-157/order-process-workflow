require 'temporalio/activity'

module Mocks
  class MockRefundPayment < Temporalio::Activity::Definition
    activity_name: RefundPayment

    def execute(transaction_id)
      Interface::REFUND_CONFIRMATION
    end
  end
end