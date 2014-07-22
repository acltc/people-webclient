class PeopleController < ApplicationController
  def index
    @people = Unirest.get("http://localhost:3000/people.json", 
              headers:{ "Accept" => "application/json" }).body
  end

  def show
    @person = Unirest.get("http://localhost:3000/people/#{params[:id]}.json", 
              headers:{ "Accept" => "application/json" }).body
  end
end
