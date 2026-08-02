# frozen_string_literal: true

module OrderProcess
  Order = Struct.new(
    :number,
    :date,
    :items,
    :payment_details,
    :customer,
    :recipient,
    :shipping_address,
    :value
  )
end
