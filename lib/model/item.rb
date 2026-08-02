# frozen_string_literal: true

module OrderProcess
  Item = Struct.new(
    :name,
    :quantity,
    :sku
  )
end
