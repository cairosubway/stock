json.array!(@stockprices) do |stockprice|
  json.extract! stockprice, :id
  json.url stockprice_url(stockprice, format: :json)
end
