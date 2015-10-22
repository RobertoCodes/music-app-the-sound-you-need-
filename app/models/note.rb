class Note < ActiveRecord::Base


  belongs_to :track, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
