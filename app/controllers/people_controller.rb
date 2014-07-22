class PeopleController < ApplicationController
  def index
    @people = JSON.parse(Unirest.get("http://localhost:3000/people.json", 
                            headers:{ "Accept" => "application/json" }).raw_body)
  end

  def show
  end
end
