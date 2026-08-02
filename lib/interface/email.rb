module Interface
  class Email
    def self.notify(customer, order_number, tracking_details)
      "Hi #{customer.first_name},\n" \
      "Your order #{order_number} has been shipped via #{tracking_details['courier']}.\n" \
      "Your tracking number is: #{tracking_details['tracking_number']}.\n" \
      "Best regards,\nThe Cheese People"
    end
  end
end