# == Schema Information
#
# Table name: dogs
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
class Dog < ApplicationRecord
   validates :name, presence: true
  #  validate :check_name_length 

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House

   has_many :toys,  
    primary_key: :id,   #dog's id
    foreign_key: :dog_id,
    class_name: :Toy

   def check_name_length
    unless self.name.length >= 3
      errors[:name] << "is too short, must be at least 3 characters."
    end
   end

   def self.lookup_name_in_ms(name)
    start = Time.now
    Dog.where(name: name)
    (Time.now - start) * 1000
   end
end
