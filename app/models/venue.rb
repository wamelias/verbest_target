class Venue < ApplicationRecord
  # Direct associations

  has_many   :best_dishes,
             :class_name => "Bookmark",
             :dependent => :destroy

  has_many   :dishes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
