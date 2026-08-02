# frozen_string_literal: true

module OrderProcess
  PaymentDetails = Struct.new(
    :card_number,
    :expiry_date,
    :name_on_card,
    :security_code
  )
end
