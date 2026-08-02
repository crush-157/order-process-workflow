require 'temporalio/workflow'

module OrderProcess
  class OrderProcessWorkflow < Temporalio::Workflow::Definition
    def execute(order)
      results = {}

      Temporalio::Workflow.logger.info("Processing order: #{order.number}")

      results[:check_inventory] = Temporalio::Workflow.execute_activity(
        CheckInventory,
        order.items,
        start_to_close_timeout: 300
      )

      if results[:check_inventory] == Interface::INVENTORY_CHECK
        Temporalio::Workflow.logger.info("Inventory checked")
      else
        raise Temporalio::ApplicationError::ApplicationError.new("Inventory check failed.")
      end

      results[:process_payment] = Temporalio::Workflow.execute_activity(
        ProcessPayment,
        order.payment_details,
        start_to_close_timeout: 300
      )
      Temporalio::Workflow.logger.info("Payment processed")

      results[:ship_goods] = Temporalio::Workflow.execute_activity(
        ShipGoods,
        order,
        start_to_close_timeout: 300
      )
      Temporalio::Workflow.logger.info("Order shipped")

      results[:notification] = Temporalio::Workflow.execute_activity(
        NotifyCustomer,
        order.customer,
        order.number,
        results[:ship_goods],
        start_to_close_timeout: 300
      )
      Temporalio::Workflow.logger.info("Customer notified")

      Temporalio::Workflow.logger.info("#{self.class} finished")
      results

    rescue Exception => e
      Temporalio::Workflow.logger.info("#{e.message}")
      notification = ['Sorry, your order could not be processed.']
      if results[:process_payment]
        Temporalio::Workflow.execute_activity(
          RefundPayment,
          results[:process_payment],
          start_to_close_timeout: 300
        )
        Temporalio::Workflow.logger.info(
          "Payment #{results[:process_payment]} has been refunded"
        )
        notification.push('Your payment has been refunded.')
      end
      results[:notification] = notification.join(' ')
      results
    end
  end
end