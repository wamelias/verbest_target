class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  belongs_to :bestdish,
             :class_name => "Bookmark",
             :foreign_key => "bookmark_id"

  belongs_to :venue

  # Indirect associations

  # Validations

end
