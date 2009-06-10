class ContactsController < ApplicationController
  
  def index
    conditions = params[:query].blank? ? nil : ['first_name LIKE ? OR last_name LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%"]    
    @contacts = Contact.find_all_contacts_pagination(params[:page], conditions)
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    
    if @contact.save
      flash[:notice] = 'Contact was successfully added.'
      redirect_to contact_path(@contact)
    else
      render :action => "new"
    end    
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])    
    
    if @contact.update_attributes(params[:contact])       
      flash[:notice] = 'Contact was successfully updated.'
      redirect_to(@contact)        
    else
      render :action => "edit"        
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])    
    @contact.destroy
    redirect_to(contacts_url)
  end
  
end
