# order-process-workflow
Example order process workflow using Temporal
## Description
The workflow proceeds as follows:
1. Workflow begins with an order.
2. The inventory is checked (if the check fails, then the workflow is failed).
3. The payment is processed.
4. The goods are "shipped".
5. The customer is notified via email.

If the workflow fails, a notification that the order cannot be processed is sent.  If payment has been made it is reversed.

## Project Structure
The code is under [lib](./lib).

The workflow is in [workflow.rb](./lib/workflow.rb).

A [client](./lib/client.rb) and a [worker](./lib/worker.rb) for the workflow are included.

The activities are under [lib/activities](./lib/activities).

The activities call an "[interface](./lib/interface)" layer which represents the API(s) for the target systems if this was real world.

The data model is under [lib/model](./lib/model).

## Instructions
1. Clone the repository.
2. `cd` to the `order-process-workflow` directory.
3. Ensure temporal is running (e.g. `temporal server start-dev`).
4. In one terminal session start the worker: `bundle exec ruby lib/worker.rb`.
5. In another terminal session start the client: `bundle exec ruby lib/client.rb`.

## Software versions
- Ruby 3.4.9

- Temporal 1.8.1

- Fedora 44 (on WSL)
