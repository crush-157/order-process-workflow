require 'temporalio/activity'

module OrderProcess
  class RefundPayment < Temporalio::Activity::Definition
    def execute(transaction_id)
      Interface::Payment.process(transaction_id)
    end
  end
end