require 'open-uri'
require 'json'

class HtmlGenerator
    def retreive_data(url)
        raw_response = open(url).read
        parsed_response = JSON.parse(raw_response)
        result = parsed_response["result"]
    end

    
    def dundas_dovercourt_wine_sales
        #Retrieve the list of stores
        products_hash = retreive_data("http://lcboapi.com/stores/3/products")

        puts "<h1>All products<h1>"
        wine = []
        products_hash.each do |product|
            if product['primary_category'] == "Ready-to-Drink/Coolers"
            #     # elsif product["has_value_added_promotion"] == true
            #         puts "#{product['name']}"
            #         # wine << product
            # end
            puts product['name']
            end
            
        end
    end

end
x = HtmlGenerator.new
x.dundas_dovercourt_wine_sales






    
# value_added_promotion_description
# has_limited_time_offer
# has_value_added_promotion

