class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string        :first_name
      t.string        :last_name
      t.string        :email
      t.string        :phone
      t.belongs_to    :company
      
      # Attachments
      t.string        :photo_file_name
      t.string        :photo_content_type
      t.integer       :photo_file_size
      
      t.timestamps
    end
    # Load some random data
    Contact.create(:first_name => "Sonny", :last_name => "Le", :email => "son.thai.le@gmail.com", :phone => "00 111 223344", :company_id => 1)
    Contact.create(:first_name => "Alan", :last_name => "Shearer", :email => "alan@test.com", :phone => "00 111 223355", :company_id => 1)
    Contact.create(:first_name => "Kevin", :last_name => "Keegan", :email => "kev@test.com", :phone => "00 111 223366", :company_id => 2)
    Contact.create(:first_name => "Shola", :last_name => "Ameobi", :email => "shola@test.com", :phone => "00 111 223377", :company_id => 3)
    Contact.create(:first_name => "Steve", :last_name => "Harper", :email => "stevie@test.com", :phone => "00 111 223388", :company_id => 3)
    Contact.create(:first_name => "Alan", :last_name => "Salty", :email => "alans@test.com", :phone => "00 111 223399", :company_id => 3)  
  end

  def self.down
    drop_table :contacts
  end
end