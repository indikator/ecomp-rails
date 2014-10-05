class Competence < ActiveRecord::Base
  belongs_to :competence_group
  has_many :competence_levels
end
