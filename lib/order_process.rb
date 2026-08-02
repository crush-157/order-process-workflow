# frozen_string_literal: true

require 'json/add/struct'
require 'json/add/date'
require_relative 'interface'
require_relative 'model'
require_relative 'order_process/workflow'
require_relative 'order_process/activities'

module OrderProcess
  TASK_QUEUE_NAME='order-process-workflow'
  ORDER_PROCESS_WORKFLOW_ID = 'order-process-workflow-id'
end
