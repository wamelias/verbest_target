class Bookmark < ApplicationRecord
  # Direct associations

  has_one    :cuisine,
             :dependent => :destroy

  has_one    :dish,
             :dependent => :destroy

  belongs_to :venue

  belongs_to :user

  # Indirect associations

  # Validations

end
