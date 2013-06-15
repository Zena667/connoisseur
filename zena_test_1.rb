require 'open-uri'
require 'json'

class HtmlGenerator
    def retreive_data(url)
        raw_response = open(url).read
        parsed_response = JSON.parse(raw_response)
        result = parsed_response["result"]
    end

    
    def dundas_dovercourt_wine_sales
        #Retrieve the list of products at dundas and dovercourt store, with limited time offer, in descending order...
        products_hash = retreive_data("http://lcboapi.com/stores/3/products?where=has_limited_time_offer&order=limited_time_offer_savings_in_cents&per_page=100&page=1")

        puts "<h1>All products<h1>"
        wine = []
        products_hash.each do |product|
            if product['primary_category'] == "Wine"
            #     # elsif product["has_value_added_promotion"] == true
            #         puts "#{product['name']}"
            #         # wine << product
            # end
            puts product['name']
            puts ["producer_name"]
            puts product['image_thumb_url']
            puts product['product_id']
            puts product['producer_name']
            puts product['primary_category']
            puts product['secondary_category']
            puts product['package']
            puts product['price_in_cents']
            puts product['regular_price_in_cents']
            puts product['limited_time_offer_savings_in_cents']
            puts product['limited_time_offer_ends_on']
            puts product['stock_type']
            puts product['secondary_category']
            puts product['sugar_content']
            puts product['origin']
            puts product['is_vqa']
            puts product['description']
            puts product['image_thumb_url']
            puts product['image_url']
            puts product['varietal']
            puts product['style']
            puts product['product_no']
            end
            
        end
    end

end
x = HtmlGenerator.new
x.dundas_dovercourt_wine_sales






    


