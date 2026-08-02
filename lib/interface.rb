require_relative 'interface/payment'
require_relative 'interface/inventory'
require_relative 'interface/shipping'
require_relative 'interface/email'

module Interface
  PAYMENT_CONFIRMATION = 'XX-YY-ZZ'
  REFUND_CONFIRMATION = 'AA-BB-CC'
  INVENTORY_CHECK = 'OK'
  COURIER = 'Planet Express'
  TRACKING_NUMBER = 'PE-314159'
end