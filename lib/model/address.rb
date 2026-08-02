# frozen_string_literal: true

module OrderProcess
  Address = Struct.new(
    :line_1,
    :line_2,
    :town,
    :county,
    :postcode
  )
end
