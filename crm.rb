require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'
@@rolodex = Rolodex.new


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  @contacts = []
  @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end