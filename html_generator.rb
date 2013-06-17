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

        print_header
        puts "<h1>All Wine Currently on Sale</h1>"

        puts "  <h2>Red Wine Selection</h2>"

        #for each new line in the csv file, iterate by row (arrays)
        CSV.foreach('new_wine_list.csv', :headers => true) do |row|
            if row['id'] != nil
                if row['type'] = "White Wine"
                     
                    puts "<div class='product_red_wine'>"
                    puts "<h3>#{row['name']}</h3>"
                    puts "  <img src='#{row['image_thumb_url']}' class='thumbnail_pic' />"
                    puts "    </div>"
                    puts row['type']
                    



                    
                end
            end
            
                       
                        



        end
        print_footer
    end
                   
                    


    
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

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Boozer</title>"
    # puts "    <link rel='stylesheet' href='normalize.css' type='text/css'>"
    puts "    <link rel='stylesheet' href='styles.css' type='text/css'>"
    puts "  </head>"
    puts "  <body>"
  end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

end

x = HtmlGenerator.new
puts x.index

