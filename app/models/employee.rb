class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: "Employee", foreign_key: :director_id
  belongs_to :director, class_name: "Employee"

  def self.tree(user_id = nil, with_colleagues = true)
    @all ||= self.all.order(:fired, :fio)
    tree = {}
    if user_id
      tree[:user] = @all.select {|e| e.id == user_id}[0]
    else
      tree[:user] = @all.select {|e| e.director_id.nil?}[0]
    end
    tree[:colleagues] = get_colleagues(tree[:user]) if with_colleagues
    tree[:subordinates] = get_subordinates(tree[:user])
    tree
  end

  private

  def self.get_subordinates(user)
    return_ary = []
    @all.select {|e| e.director_id == user.id && e.id != user.id}.each do |subordinate|
      return_ary << tree(subordinate.id, false)
    end
    return_ary
  end

  def self.get_colleagues(user)
    return_ary = []
    @all.select {|e| e.director_id == user.director_id && e.id != user.id}.each do |colleague|
      return_ary << tree(colleague.id, false)
    end
    return_ary
  end
end