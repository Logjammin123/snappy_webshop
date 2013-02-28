require 'watir-webdriver'

#url = 'http://0.0.0.0:3000'
url = 'http://192.168.2.6'

b = Watir::Browser.new

start = Time.now
clear_caching_time = 0

# A anonymous user looks around.
#
['AA', 'AB', 'AH'].each do |product_name|
  b.goto url
  Watir::Wait.until { b.link(:text, product_name).exist? }
  b.link(:text, product_name).click
  Watir::Wait.until { b.link(:text, 'Webshop').exist? }
  b.link(:text, 'Webshop').click
end

sub_start = Time.now
b.close
b = Watir::Browser.new
clear_caching_time += Time.now - sub_start

# Bobs logs in
#
b.goto url
b.goto "#{url}/users/sign_in"
b.text_field(:id, "user_email").set("bob@aol.com")
b.text_field(:id, "user_password").set("123")
b.button(:name, "commit").click

# Bob looks around.
#
['AA', 'AB', 'AH'].each do |product_name|
  b.goto url
  Watir::Wait.until { b.link(:text, product_name).exist? }
  b.link(:text, product_name).click
  Watir::Wait.until { b.link(:text, 'Webshop').exist? }
  b.link(:text, 'Webshop').click
end

# Bob rates some products
#
['AA', 'AD', 'AI'].each do |product_name|
  b.goto url
  b.link(:text, product_name).click
  star_id = 'product_' + product_name + '_rating_2'
  b.link(:id, star_id).click
end

# Bob buys 3 products
#
[1, 3, 5].each do |product_id|
  b.goto url
  add_button_id = 'add_' + product_id.to_s
  b.link(:id, add_button_id).click
end

# Bob logs out
#
b.link(:text, 'Logout').click

puts "#{(Time.now - start) - clear_caching_time} seconds"

b.close
