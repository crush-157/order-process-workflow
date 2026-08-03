require 'temporalio/client'

require_relative 'order_process'

client = Temporalio::Client.connect('localhost:7233','default')

jo_bloggs = OrderProcess::Person.new(
  email_address: "jo.bloggs@email.com",
  first_name: "Josephine",
  last_name: "Bloggs"
)

address = OrderProcess::Address.new(
  line_1: '22 Acacia Avenue',
  town: 'Dunwich',
  county: 'Suffolk',
  postcode: 'IP17 3BQ',
)

items = [
  OrderProcess::Item.new(
    name: 'Baron Bigod Cheese, 3kg',
    quantity: 1,
    sku: 'FF-BB-3'
  )
]

jo_visa_card = OrderProcess::PaymentDetails.new(
  name_on_card: 'J Bloggs',
  card_number: '1234 4567 8910 1112',
  expiry_date: '08/29',
  security_code: '123'
)

order = OrderProcess::Order.new(
  number: 1446,
  date: Date.today,
  items: items,
  payment_details: jo_visa_card,
  customer: jo_bloggs,
  recipient: jo_bloggs,
  shipping_address: address,
  value: 109.0
)

result = client.execute_workflow(
  OrderProcess::OrderProcessWorkflow,
  order,
  id: OrderProcess::ORDER_PROCESS_WORKFLOW_ID,
  task_queue: OrderProcess::TASK_QUEUE_NAME,
)

puts result['notification']