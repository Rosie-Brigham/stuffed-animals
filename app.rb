require 'sinatra'
require 'mongoid'
require 'json'

# this is the mongoid setup
require 'pony'
require 'highline/import'

Mongoid.load!("mongoid.yml", :development)


class Visitor
    include Mongoid::Document

    field :name
    field :place
    field :email
    
end


#so here you put the sinatra app... 
#to display the signup form go here...
get '/' do
  erb :welcome
end

post '/' do
   @name = params[:visitor_name].capitalize
    @place = params[:place].capitalize
    erb :form
end


post '/form' do
   
    @first = params[:first]
    @second = params[:second]
    @third = params[:third]
    #@museum = museum
    #@finalText = finalText
    
# slider (hopefully)



# musum advice
def museum
  if @first == 'A' && @second == 'i' && @third == '1'
    return "The Vault"
  elsif @first =='A' && @second == 'i' && @third == '2'
    return "Tate Modern"
  elsif @first =='A' && @second == 'i' && @third == '3'
    return "Tate Britain"
  elsif @first =='A' && @second == 'i' && @third == '4'
    return "Barbican"  

  elsif @first =='A' && @second == 'ii' && @third == '1'
    return "The Wallace Collection"
  elsif @first =='A' && @second == 'ii' && @third == '2'
    return "The V+A"
  elsif @first =='A' && @second == 'ii' && @third == '3'
    return "The National Gallery"
  elsif @first =='A' && @second == 'ii' && @third == '4'
    return "The Museum of the Bank of England"

  elsif @first =='A' && @second == 'iii' && @third == '1'
    return "The Natural History Museum"
  elsif @first =='A' && @second == 'iii' && @third == '2'
    return "The Cigar Museum"
  elsif @first =='A' && @second == 'iii' && @third == '3'
    return "The British Museum"
  elsif @first =='A' && @second == 'iii' && @third == '4'
    return "The National Portrait Gallery"

  elsif @first =='A' && @second == 'iv' && @third == '1'
    return "The Wallace Collection"
  elsif @first =='A' && @second == 'iv' && @third == '2'
    return "Sir John Soane Museum"
  elsif @first =='A' && @second == 'iv' && @third == '3'
    return "Southwark"
  elsif @first =='A' && @second == 'iv' && @third == '4'
    return "The Cartoon Museum"

  elsif @first =='A' && @second == 'v' && @third == '1'
    return "Trafalga Square"
  elsif @first =='A' && @second == 'v' && @third == '2'
    return "Hyde Park"
  elsif @first =='A' && @second == 'v' && @third == '3'
    return "Strand/Mall/Houses of Parliament"
  elsif @first =='A' && @second == 'v' && @third == '4'
    return "Brick Lane/East end"

  elsif @first =='B' && @second == 'i' && @third == '1'
    return "Greenwich"
  elsif @first =='B' && @second == 'i' && @third == '2'
    return "Barthes Pathology Museum"
  elsif @first =='B' && @second == 'i' && @third == '3'
    return "Natural History Museum"
  elsif @first =='B' && @second == 'i' && @third == '4'
    return "Welcome Collection"

  elsif @first =='B' && @second == 'ii' && @third == '1'
    return "Twinnings Tea Shop and Museum"
  elsif @first =='B' && @second == 'ii' && @third == '2'
    return "Barthes Pathology Museum"
  elsif @first =='B' && @second == 'ii' && @third == '3'
    return "Natural History Museum (Tring?)"
  elsif @first =='B' && @second == 'ii' && @third == '4'
    return "Welcom Collection"

  elsif @first =='B' && @second == 'iii' && @third == '1'
    return "Royal Institution"
  elsif @first =='B' && @second == 'iii' && @third == '2'
    return "Science Museum"
  elsif @first =='B' && @second == 'iii' && @third == '3'
    return "The City"
  elsif @first =='B' && @second == 'iii' && @third == '4'
    return "Imperial War Museum"

  elsif @first =='B' && @second == 'iv' && @third == '1'
    return "UCL Museums"
  elsif @first =='B' && @second == 'iv' && @third == '2'
    return "Gordon Museum"
  elsif @first =='B' && @second == 'iv' && @third == '3'
    return "Old Operating Theater"
  elsif @first =='B' && @second == 'iv' && @third == '4'
    return "Horniman"

  elsif @first =='B' && @second == 'v' && @third == '1'
    return "Gas lamps"
  elsif @first =='B' && @second == 'v' && @third == '2'
    return "Highgate"
  elsif @first =='B' && @second == 'v' && @third == '3'
    "Primrose Hill"
  else @first =='B' && @second == 'v' && @third == '4'
    return "Garden Museum"
      
end
end

    n = Visitor.new(:name => @name, :place => @place)
    n.save

    #this took the users input and saved it to the database
    #pony

    erb :result
    #getting up the thanks page

end
#to keep a record of everyone who has visited



get '/list' do
    puts 'hello-world'
    @visitor = Visitor.all
    erb :records
end

post '/email' do 
"hello-world"
    vemail = params[:email]
    d = Visitor.new(:email => vemail)

     Pony.mail(:to => vemail, 
        :subject => "The amazing mini-meandering machine", :body => erb(:email, :layout => false))
    
    erb:thanks
end

#for email
 Pony.options = { 
  :via => 'smtp',
  :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['USER_NAME'],
      :password             => ENV['PASSWORD'],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  }
  