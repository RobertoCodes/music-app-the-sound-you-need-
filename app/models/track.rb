class Track < ActiveRecord::Base


  belongs_to :album, dependent: :destroy
  has_many :notes
end
