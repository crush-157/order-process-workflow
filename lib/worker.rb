require 'temporalio/client'
require 'temporalio/worker'
require 'logger'
require_relative 'order_process'

logger = Logger.new($stdout, level: Logger::INFO)

client = Temporalio::Client.connect('localhost:7233','default',logger:)

worker = Temporalio::Worker.new(
  client:,
  task_queue: OrderProcess::TASK_QUEUE_NAME,
  workflows: [OrderProcess::OrderProcessWorkflow],
  activities: [
    OrderProcess::ProcessPayment,
    OrderProcess::RefundPayment,
    OrderProcess::CheckInventory,
    OrderProcess::ShipGoods,
    OrderProcess::NotifyCustomer,
  ]
)

worker.run(shutdown_signals: ['SIGINT'])