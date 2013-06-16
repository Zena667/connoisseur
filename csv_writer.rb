require 'csv'
require 'json'
require 'open-uri'

###should try to fix line skips in CAV file as seen in Excel

begin
    # Open CSV file
    f = CSV.open("new_wine_list.csv", "wb")

    # Setup CSV headers
    csv_headers = %w( name id type producer_name  
                    package price regular_price savings 
                    offer_end_date stock_type 
                    sugar_content origin is_vqa description image_thumb_url 
                    image_url varietal style) 
    f << csv_headers

        #method to get JSON to parse the url
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
                            id = product['id']
                            type = product['secondary_category']
                            producer_name = product['producer_name'] 
                            package = product['package']
                            price = product['price_in_cents'].to_f / 100
                            regular_price = product['regular_price_in_cents'].to_f / 100
                            savings = product['limited_time_offer_savings_in_cents'].to_f / 100
                            offer_end_date = product['limited_time_offer_ends_on']
                            stock_type = product['stock_type']
                            sugar_content = product['sugar_content']
                            origin = product['origin']
                            is_vqa = product['is_vqa']
                            description = product['description']
                            image_thumb_url = product['image_thumb_url']
                            image_url = product['image_url']
                            varietal = product['varietal']
                            style = product['style']
                    end
                     
                f << [name, id, type, producer_name,  
                    package, price, regular_price, savings, 
                    offer_end_date, stock_type, 
                    sugar_content, origin, is_vqa, description, image_thumb_url, 
                    image_url, varietal, style]

                puts "wine, wine, wine..."
                
            end
        puts "Writing to CSV file page number: #{page_num}"
        page_num += 1
    end
    f.close()
end










