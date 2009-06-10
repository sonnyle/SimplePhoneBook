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
  end

  def self.down
    drop_table :contacts
  end
end