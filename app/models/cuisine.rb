class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :destroy

  belongs_to :bookmark

  # Indirect associations

  # Validations

end
