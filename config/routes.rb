ActionController::Routing::Routes.draw do |map|
 
  # Contacts path
  map.resources :contacts
  
  # Companies path
  map.resources :companies

  # Homepage path
  map.root :controller => "contacts"
  
end
