class Person

  attr_accessor :id, :first_name, :middle_name, :last_name, :suffix, :email, :phone

  def initialize(attributes_hash)
    @id = attributes_hash["id"]
    @first_name = attributes_hash["first_name"]
    @middle_name = attributes_hash["middle_name"]
    @last_name = attributes_hash["last_name"]
    @suffix = attributes_hash["suffix"]
    @email = attributes_hash["email"]
    @phone = attributes_hash["phone"]
  end

  def full_name
    return "#{self.first_name} #{self.middle_name} #{self.last_name} #{self.suffix}"
  end

  def self.find(id)
    hash = Unirest.get("http://localhost:3000/people/#{id}.json", 
              headers:{ "Accept" => "application/json" }).body
    return Person.new(hash)
  end

  # REMINDER ABOUT WHAT attr_accessor IS A SHORTCUT FOR:

  # def first_name
  #   return @first_name
  # end

  # def first_name=(name)
  #   @first_name = name
  # end

end



p = Person.new({"id" => 1, "first_name" => "Mary"})
p.full_name


# Person.new({:id => 1, :first_name => "Mary", })