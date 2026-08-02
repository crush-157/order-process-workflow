module Interface
  class Payment
    def self.process(details)
      Interface::PAYMENT_CONFIRMATION
    end

    def self.refund(details)
      Interface::REFUND_CONFIRMATION
    end
  end
end