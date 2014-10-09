class Color < ActiveRecord::Base
  has_many :competence_groups

  def self.option_for_select
    all = Color.all
    r_ary = []
    all.each do |color|
      r_ary << [color.name, color.id, data: {color: "#{color.first}"}]
    end
    r_ary
  end
end
