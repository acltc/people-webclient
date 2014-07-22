class PeopleController < ApplicationController
  def index
    array_of_hashes = Unirest.get("http://localhost:3000/people.json", 
              headers:{ "Accept" => "application/json" }).body
    @people = []
    array_of_hashes.each do |attributes_hash|
      @people << Person.new(attributes_hash)
    end
  end

  def show
    attributes_hash = Unirest.get("http://localhost:3000/people/#{params[:id]}.json", 
              headers:{ "Accept" => "application/json" }).body
    @person = Person.new(attributes_hash)
  end

  def new
  end

  def create
    @person = Unirest.post("http://localhost:3000/people.json", 
              headers:{ "Accept" => "application/json" }, 
              parameters:{ :person => 
                {
                  :first_name => params[:first_name], :middle_name => params[:middle_name], :last_name => params[:last_name], :suffix => params[:suffix], :email => params[:email], :phone => params[:phone]
                }
              }).body

    redirect_to person_path(@person["id"])
  end
end
