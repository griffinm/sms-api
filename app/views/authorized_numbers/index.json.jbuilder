json.array!(@authorized_numbers) do |authorized_number|
  json.extract! authorized_number, :id, :phone_number
  json.url authorized_number_url(authorized_number, format: :json)
end
