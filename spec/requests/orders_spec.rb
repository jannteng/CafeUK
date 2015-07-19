require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
  	
  	it "display all orders" do
  		visit orders_path
  		page.should have_content "burger"
  		
  	end
  
  end
end
