class Bookmark < ApplicationRecord
  # Direct associations

  has_one    :dish,
             :dependent => :destroy

  belongs_to :venue

  belongs_to :user

  # Indirect associations

  # Validations

end
