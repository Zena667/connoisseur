require 'csv'
require 'json'
require 'open-uri'

begin
    # Open CSV file
    f = CSV.open("new_wine_list.csv", "wb")

    # Setup CSV headers
    csv_headers = %w( name primary_category producer_name secondary_category) 
    f << csv_headers

    def retreive_data(url)
        raw_response = open(url).read
        parsed_response = JSON.parse(raw_response)
        result = parsed_response["result"]
    end

    #retreive data from api query
    products_hash = retreive_data("http://lcboapi.com/stores/3/products?where=has_limited_time_offer&order=limited_time_offer_savings_in_cents&per_page=100&page=1")

    products_hash.each do |product|
        if product['primary_category'] == "Wine"
        #     # elsif product["has_value_added_promotion"] == true
        #         puts "#{product['name']}"
                name = product['name']
                prime_cat = product['primary_category']
                prod_name = product['producer_name'] 
                sec_cat = product['secondary_category']
        end
    
    puts "hello"

    f << [name, prime_cat, prod_name, sec_cat]

    puts "Writing to CSV..."

    end
    f.close()
end










