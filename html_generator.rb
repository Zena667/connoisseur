# As a developer, create an HTMLGenerator class to print the structure and content of an HTML page 
# dynamically. The HTMLGenerator class should have the following methods: "index", "show", 
# "print_header", "print_footer", "retrieve_data(url)", "format_price(cents_string)".

require 'json'
require 'open-uri'
require 'csv'

class HtmlGenerator

    def initialize
        @csv_headers = %w( name id type producer_name  
                    package price regular_price savings 
                    offer_end_date stock_type 
                    sugar_content origin is_vqa description image_thumb_url 
                    image_url varietal style)
    end
    

    def index
            puts "<h1>All products</h1>"

        CSV.foreach('new_wine_list.csv', {:headers=>true, :skip_blanks=>true}) do |row|
            row.each do |header, value| 
                if value != nil
                    @csv_headers.each_index do |i|
                        puts "#{@csv_headers[i]} is #{row[i]}"
                    end
                end
            end
        end
    end
end

x = HtmlGenerator.new
puts x.index
    
    #   puts "<div class='product'>"
    #   puts "  <h2>#{product['name']}</h2>"
    #   puts "  <img src='#{product['image_thumb_url']}'  class='product-thumbnail'/>"
    #   puts "  <ul class='product-data'>"
    #   puts "    <li>id: #{product['id']}</li>"
    #   puts "    <li>#{product['producer_name']}</li>"
    #   puts "    <li>#{product['primary_category']}</li>"
    #   puts "    <li>#{product['secondary_category']}</li>"
    #   puts "    <li>#{product['volume_in_milliliters']} ml</li>"
    #   puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
    #   puts "  </ul>"
    #   puts "</div>"
    # end
    
#     puts "<footer>"
#     puts "  For more info see the <a href='http://lcboapi.com/docs/products'>products API docs</a>."
#     puts "</footer>"

#     print_footer
#   end

#   def show(product_id)
#     # Retrieve the specified product
#     product = retrieve_data("http://lcboapi.com/products/#{product_id}")

#     print_header
#     puts "<div class='product'>"
#     puts "  <h2>#{product['name']}</h2>"
#     puts "  <img src='#{product['image_url']}'  class='product-image'/>"
#     puts "  <ul class='product-data'>"
#     puts "    <li>id: #{product['id']}</li>"
#     puts "    <li>#{product['producer_name']}</li>"
#     puts "    <li>#{product['primary_category']}</li>"
#     puts "    <li>#{product['secondary_category']}</li>"
#     puts "    <li>#{product['origin']}</li>"
#     puts "    <li>#{product['volume_in_milliliters']} ml</li>"
#     puts "    <li>#{product['package']}</li>"
#     puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
#     puts "    <li>#{product['serving_suggestion']}</li>"
#     puts "    <li>#{product['tasting_note']}</li>"
#     puts "    <li>Tags: #{product['tags']}</li>"
#     puts "  </ul>"
#     puts "</div>"
#     print_footer
#   end

#   def print_header
#     puts "<html>"
#     puts "  <head>"
#     puts "    <title>Connoisseur</title>"
#     puts "    <link rel='stylesheet' href='normalize.css' type='text/css'>"
#     puts "    <link rel='stylesheet' href='styles.css' type='text/css'>"
#     puts "  </head>"
#     puts "  <body>"
#   end

#   def print_footer
#     puts "  </body>"
#     puts "</html>"
#   end

#   def retrieve_data(url)
#     # Retrieve JSON-formatted text from lcboapi.com
#     raw_response = open(url).read

#     # Parse JSON-formatted text into a Ruby Hash
#     parsed_response = JSON.parse(raw_response)

#     # Return just the actual result data from the response, ignoring metadata
#     result = parsed_response["result"]
#   end

#   # Convert a string of a price in cents to a float.
#   # e.g. "199" to 1.99
#   def format_price(cents_string)
#     cents_string.to_f/100
#   end

# end

