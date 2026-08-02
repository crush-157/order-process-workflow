# frozen_string_literal: true

require 'minitest/autorun'
require 'temporalio/testing/workflow_environment'
require 'temporalio/worker'
require 'json'
require_relative '../workflow'
require_relative '../activities'
require_relative './mocks'
require_relative './sample_data'

class TestOrderProcessWorkflow < Minitest::Test
  def test_emailing_customer
    Temporalio::Testing::WorkflowEnvironment.start_time_skipping do |env|
      worker = Temporalio::Worker.new(
        client: env.client,
        task_queue: 'test-order-process-workflow',
        workflows: [OrderProcessWorkflow],
        activities: [Mocks::EmailCustomer]
      )

      worker.run do
        input = { 'customer' => SampleData.customer }

        result = env.client.execute_workflow(
          OrderProcessWorkflow,
          input,
          id: 'test-order-process-workflow-id',
          task_queue: 'test-order-process-workflow'
        )

        assert_equal 'Email sent to joe.bloggs@email.com', result['email_confirmation']
      end
    end
  end
end

mock_result {
  "check_inventory" => "OK",
  "process_payment" => "XX-YY-ZZ",
  "ship_goods" => {"courier" => "Planet Express", "tracking_number" => "PE-314159"},
  "notification" => "Hi Josephine,\nYour order 1446 has been shipped via Planet Express.\nYour tracking number is: PE-314159.\nBest regards,\nThe Cheese People"
}
