class Company < ActiveRecord::Base
  
  # Validations
  validates_presence_of :name
  
  # Relationship
  has_many :contacts  
  
  def full_address
    full_address = []
    full_address << self.address_line_1 
    full_address << self.address_line_2
    full_address << self.city
    full_address << self.county 
    full_address << self.postcode
    full_address.delete(nil)
    full_address.join("<br />")
  end
  
  # Contact selector
  def associate_with_contacts_by_id(contact_ids)

     clear_all_contact_associations

     contact_ids.each do |id|  
       contact = Contact.find_by_id(id)
       associate_with_contact(contact)
     end

   end

   def clear_all_contact_associations
     logger.info "clearing company contacts association"     
     self.contacts.clear     
   end

   def associate_with_contact(contact)
     unless self.contacts.include? contact
       self.contacts << contact
     end
   end

   def is_associated_with?(contact)
     self.contacts.include?(contact)
   end
  
end
