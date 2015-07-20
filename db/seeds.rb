# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
	
	def load_data
		puts "Populating database"
		create_admin_accounts
		register_members
		make_drinks
		bake_cakes
		make_orders
		puts "Database populated."
	end

	def create_admin_accounts
		puts "Adding admin."

		admin = User.new(:email => 'admin@example.com', :first_name => 'admin_first', :last_name => 'admin_last', :password => 'adminpassword', :bio => "I am the ADMIN")
		admin.skip_confirmation!
		admin.save

		puts "Admin created."
	end


	def register_members
		puts "Creating test users."

		source_path = Rails.root.join('db', 'seeds', 'users.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		contents.each do |row|
		  User.create row.to_hash
		end

		puts "Finished loading test users."
	end

	def make_drinks
		puts "Making drinks."

		source_path = Rails.root.join('db', 'seeds', 'drinks.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		contents.each do |row|
		  Drink.create row.to_hash
		end

		puts "Finished making drinks."
	end

	def bake_cakes
		puts "Baking cakes"

		source_path = Rails.root.join('db', 'seeds', 'cakes.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		contents.each do |row|
		  Cake.create row.to_hash
		end

		puts "Finished baking cakes."
	end

	def make_orders
		puts "Making orders"

		source_path = Rails.root.join('db', 'seeds', 'orders.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		contents.each do |row|
		  Order.create row.to_hash
		end
		
		puts "Finished ordering"			
	end

	load_data
