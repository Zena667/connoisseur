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
        page_num = 1
            while page_num < 4
                products_hash = retreive_data("http://lcboapi.com/stores/3/products?where=has_limited_time_offer&order=limited_time_offer_savings_in_cents&per_page=100&page=#{page_num}")

                products_hash.each do |product|
                    if product['primary_category'] == "Wine"
                            name = product['name']
                            prime_cat = product['primary_category']
                            prod_name = product['producer_name'] 
                            sec_cat = product['secondary_category']
                    end
                     
                f << [name, prime_cat, prod_name, sec_cat]
                puts "wine, wine, wine..."
                
            end
        puts "Writing to CSV file page number: #{page_num}"
        page_num += 1
    end
    f.close()
end










