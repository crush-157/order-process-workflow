require_relative 'mocks/process_payment'
require_relative 'mocks/check_inventory'
require_relative 'mocks/ship_goods'
require_relative 'mocks/notify_customer'
require_relative 'mocks/refund_payment'
require_relative '../lib/model'

module Mocks
  module SampleData
    BLANK_ORDER = OrderProcess::Order.new
  end
end
