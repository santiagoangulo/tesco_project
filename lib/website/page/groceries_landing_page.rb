class Website::Page::GroceriesLandingPage < Website::Base
	
	set_url "#{Website::Site.instance.url}/groceries"
	set_url_matcher /groceries/

	element :search_box, "#searchBox-1"
	element :search_button, "input#searchBtn"
	elements :retrieved_product_grid, "div.productLists ul li"
	elements :list_products_in_basket, "ul#Active-Active-Default li"

	def search_for(item)
		search_box.set item
		search_button.click
	end

	def add_first_valid_results_to_shopping_bag(limit=1)
		counter = 0
		retrieved_product_grid.each do |current_product|
			product_info = current_product.text
			if (( product_info =~ /Add to basket/) != nil) && (counter < limit)
				within current_product do
					find('input.submit').click
					counter = counter + 1					
				end
			end
		end
	end

	def empty_basket
		# if basket contains elements from a former test. Empty it
		if (has_list_products_in_basket?)
			list_products_in_basket.each do |current_product_in_basket|
				within current_product_in_basket do
					find('a.remove').click
				end
			end
		end
	end

	def items_in_basket_are(expected_product)
		if (has_list_products_in_basket?)
			list_products_in_basket.each do |current_product_in_basket|
				expect(current_product_in_basket.text =~ /#{expected_product}/).not_to be_nil 
			end
		end	
	end

end