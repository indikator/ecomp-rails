class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: "Employee", foreign_key: :director_id
  belongs_to :director, class_name: "Employee"

  def self.tree(director_id = nil)
    @all ||= self.all
    @tree = Hash.new
    @tree[:user] = @all.select {|e| e.director_id == director_id}[0]
    @tree[:colleagues] = get_colleagues @tree[:user]
    @tree[:subordinates] = get_subordinates @tree[:user]
    @tree
  end

  private

  def self.get_subordinates(user)
    @all.select {|e| e.director_id == user.id && e.id != user.id}
  end

  def self.get_colleagues(user)
    @all.select {|e| e.director_id == user.director_id && e.id != user.id}
  end
end