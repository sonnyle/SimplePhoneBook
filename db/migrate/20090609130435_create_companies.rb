class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string        :name
      t.string        :address_line_1
      t.string        :address_line_2
      t.string        :city
      t.string        :county
      t.string        :postcode
      
      t.timestamps
    end
    
    # Load some random data
    Company.create(:name => "Banana", :address_line_1 => "Some street", :city => "Birmingham", :county => "Midlands", :postcode => "NE1 1EE")
    Company.create(:name => "Apple", :address_line_1 => "Silicon Valley", :city => "Wimbledon", :county => "London", :postcode => "SW19 3LY")
    Company.create(:name => "Orange", :address_line_1 => "City Garden", :city => "London", :county => "London", :postcode => "SE1 8TG")
    Company.create(:name => "Pear", :address_line_1 => "Super Market Road", :city => "Newcaslte", :county => "Northumberland", :postcode => "YK2 4BH")
    Company.create(:name => "Water Melon", :address_line_1 => "Farmer Street", :city => "London", :county => "London", :postcode => "NT9 8EG")
    Company.create(:name => "Mango", :address_line_1 => "Wilton Cresent", :city => "Birmingham", :county => "Midlands", :postcode => "HN1 3TL")
  end

  def self.down
    drop_table :companies
  end
end
