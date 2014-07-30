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
    @person = Unirest.post("#{ENV['API_DOMAIN']}/api/v1/people.json",
              headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['PEOPLE_API_KEY']}", "X-User-Email" => "#{ENV['PEOPLE_API_EMAIL']}" },
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
    @person = Unirest.get("#{ENV['API_DOMAIN']}/api/v1/people/#{params[:id]}.json", 
                  headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['PEOPLE_API_KEY']}", "X-User-Email" => "#{ENV['PEOPLE_API_EMAIL']}" }).body
  end

  def update
    @person = Unirest.patch("#{ENV['API_DOMAIN']}/api/v1/people/#{params[:id]}.json",
              headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['PEOPLE_API_KEY']}", "X-User-Email" => "#{ENV['PEOPLE_API_EMAIL']}" },
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
    Unirest.delete("#{ENV['API_DOMAIN']}/people/api/v1/#{params[:id]}.json",
      headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['PEOPLE_API_KEY']}", "X-User-Email" => "#{ENV['PEOPLE_API_EMAIL']}" })

    redirect_to people_path
  end


end
