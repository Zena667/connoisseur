require 'open-uri'
require 'json'

#run LCBO Api query as per the website, comes in as a string (can't do much with this, need to parse to isolate)
raw_response = open("http://lcboapi.com/products.json").read

#calling parse method on class JSON, feeding it the muffled api created text as a variable
booze_data = JSON.parse(raw_response)

#the JSON.parse method has changed raw_response into a hash


#iterates through hash present at result key (because an array is present here, then grabs the name key)
puts booze_data["result"].each do |product_hash|
    #need to do separate puts statements for each key, like id, name, etc.
    puts "<h1>#{product_hash["name"]}</h1>" 
    puts product_hash["price_in_cents"]
    puts product_hash["price_in_cents"]
    puts product_hash["price_per_liter_of_alcohol"]
end
