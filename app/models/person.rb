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

end