require 'rails_helper'
require 'pry'

RSpec.describe 'Orders', type: :request do

  before do
    @order = Order.create :order => 'burger'
  end

  describe 'GET /orders' do
  	
  	it 'displays all orders' do
  		visit orders_path
  		expect(page).to have_content 'burger'
  	end

  	it 'creates a new order' do
  		visit orders_path
      click_link 'Add new order'
      current_path.should == new_order_path
  		fill_in 'Order', :with => 'chicken'
  		click_button 'Create Order'
  		current_path.should == orders_path
  		expect(page).to have_content 'chicken'
  	end
  
  end

  describe 'PUT /orders' do
    it 'edits an order' do
      visit orders_path
      click_link 'Edit'
      current_path.should == edit_order_path(@order)
      find_field('Order').value == 'burger'
      fill_in 'Order', :with => 'beef'
      click_button "Update Order"
      current_path.should == orders_path
      expect(page).to have_content 'Your order has successfully been updated.'
      expect(page).to have_content 'beef'
    end

    it 'should not update an empty order' do
      visit orders_path
      click_link 'Edit'
      fill_in 'Order', :with => ''
      click_button 'Update Order'
      current_path.should == edit_order_path(@order)
      expect(page).to have_content 'There was an error updating your order.'
    end
  end

  describe 'DELETE /orders' do
    it 'should delete an order' do
      visit orders_path
      page.find("#order_#{@order.id}").click_link "Delete"
      current_path.should == orders_path
      expect(page).to have_content 'Order has been successfully deleted.'
      expect(page).to_not have_content 'burger'
    end
  end
end
