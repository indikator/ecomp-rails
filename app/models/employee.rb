class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: "Employee", foreign_key: :director_id
  belongs_to :director, class_name: "Employee"

  def tree(start = nil)
    all = self.all
    all_hash = Hash.new
    all.each do |user|
      all_hash[user.id] = user
    end
  end
end
