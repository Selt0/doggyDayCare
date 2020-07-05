class House < ApplicationRecord

  has_many :dogs,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Dog

  # long way
  # def toys
  #   toys = []

  #   dogs.each do |dog|
  #     toys.concat(dog.toys)
  #   end

  #   toys
  # end

  has_many :toys,
    through: :dogs, 
    source: :toys
end