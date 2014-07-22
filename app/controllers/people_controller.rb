class PeopleController < ApplicationController
  def index
    @people = Unirest.get("http://localhost:3000/people.json", 
              headers:{ "Accept" => "application/json" }).body
  end

  def show
  end
end
