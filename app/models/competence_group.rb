class CompetenceGroup < ActiveRecord::Base
  belongs_to :color
  has_many :competences
end
