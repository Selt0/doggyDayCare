# == Schema Information
#
# Table name: toys
#
#  id     :bigint           not null, primary key
#  name   :string           not null
#  dog_id :integer          not null
#  color  :string           not null
#
class Toy < ApplicationRecord
  # def dog
  #   Dog.find(dog_id)
  # end

  belongs_to :dog,  
    primary_key: :id,    # dog's id
    foreign_key: :dog_id,
    class_name: :Dog

  has_one :house,
    through: :dog,
    source: :house
end
