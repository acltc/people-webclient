class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new

  end

  def create
    @person = Unirest.post("http://localhost:3000/people.json",
              headers:{ "Accept" => "application/json" },
              parameters: { :person => 
                            {
                              :first_name => params[:first_name],
                              :middle_name => params[:middle_name],
                              :last_name => params[:last_name],
                              :suffix => params[:suffix],
                              :email => params[:email],
                              :phone => params[:phone]
                            }
                          }
              ).body

    redirect_to person_path(@person["id"])
  end

  def edit
    @person = Unirest.get("http://localhost:3000/people/#{params[:id]}.json", 
                  headers:{ "Accept" => "application/json" }).body
  end

  def update
    @person = Unirest.patch("http://localhost:3000/people/#{params[:id]}.json",
              headers:{ "Accept" => "application/json" },
              parameters: { :person => 
                            {
                              :first_name => params[:first_name],
                              :middle_name => params[:middle_name],
                              :last_name => params[:last_name],
                              :suffix => params[:suffix],
                              :email => params[:email],
                              :phone => params[:phone]
                            }
                          }
              ).body

    redirect_to person_path(@person["id"])
  end

  def destroy
    Unirest.delete("http://localhost:3000/people/#{params[:id]}.json",
      headers:{ "Accept" => "application/json"})

    redirect_to people_path
  end


end
