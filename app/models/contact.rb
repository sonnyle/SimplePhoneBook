class Contact < ActiveRecord::Base
  # Paperclip Plugin
  has_attached_file :photo,
    :styles         => { :thumb => "50x50#", :small  => "120x120#" },
    :default_style  => :small,
    :url            => "/assets/contacts/:id/:style_:basename.:extension",
    :path           => ":rails_root/public/assets/contacts/:id/:style_:basename.:extension",
    :default_url    => "/assets/contacts/:style_no_photo.png"
  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :photo, :less_than => 1.megabytes
  
  # Relationship
  belongs_to :company
  
  # Validations  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email, :case_sensitive => false  
  validates_format_of :email, 
    :with => /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/  
  validates_format_of :phone,
    :with => /^([0]{2,2})+ (\d\d\d)+ (\d\d\d\d\d\d)+$/, :allow_blank => true, :message => "must be in the format of 00 xxx xxxxxx"
  
  # Contants
  cattr_reader :per_page
  @@per_page = 5


  def before_save
    self.email.downcase!
  end   
  
  def full_name
    self.first_name + " " + self.last_name
  end
  
  def self.find_all_unassigned_and_order_by_first_name
    find(:all, :order=>'first_name', :select => ["first_name, last_name, id"], :conditions=>["company_id IS NULL"])
  end
  
  # Find all contacts order by firstname and paginate
  def self.find_all_contacts_pagination(page, conditions)
    paginate :page => page, :order => "first_name ASC", :conditions => conditions
  end  

end