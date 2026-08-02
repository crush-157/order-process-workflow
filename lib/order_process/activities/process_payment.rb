require 'temporalio/activity'

module OrderProcess
  class ProcessPayment < Temporalio::Activity::Definition
    def execute(payment_details)
      Interface::Payment.process(payment_details)
    end
  end
end