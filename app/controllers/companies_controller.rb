class CompaniesController < ApplicationController
  
  def index
    @companies = Company.find(:all, :order => "name ASC")
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    
    if @company.save
      flash[:notice] = 'Company was successfully added.'
      redirect_to company_path(@company)
    else
      render :action => "new"
    end    
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])    
    contacts_to_assign = params[:contacts][:ids] rescue []
    
    if @company.update_attributes(params[:company])
      @company.associate_with_contacts_by_id(contacts_to_assign) 
      flash[:notice] = 'Company was successfully updated.'
      redirect_to(@company)        
    else
      render :action => "edit"        
    end
  end
  
  def destroy
    @company = Company.find(params[:id])    
    @company.destroy
    redirect_to(companies_url)
  end

end
