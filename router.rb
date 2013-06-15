# As a user, I can specify two actions, "index" or "show" + [id], as my command­line arguments.
# a. If the "index" action is specified, the command line should output the HTML for a list of 
# products.
# b. If the "show" + [id] action is specified, the command line should output a detailed product 
# page for a product with the given id. Note that [id] should be replaced with an actual product 
# id (without square brackets). The product id's can be found in the output of the index action.
# 3. As a user, if I specify "index" + an optional second parameter, which can be treated like a 
# search term, to only show results that match the given word (e.g. "ruby router.rb index bourbon" 
#     would list only products that contain the word "bourbon" in one of the fields).


require_relative 'html_generator'

if ARGV.empty?
  puts "Usage: ruby router.rb [action]"
else
  action = ARGV[0]
  generator = HtmlGenerator.new

  if action == "index"
    search_text = ARGV[1]
    generator.index(search_text)
  elsif action == "show"
    product_id = ARGV[1]
    if product_id.nil?
      puts "Usage: ruby router.rb show [product_id]"
    else
      generator.show(product_id)
    end
  else
    puts "Unknown action #{action}. Use index or show."
  end
end



# ruby router.rb index > output.html