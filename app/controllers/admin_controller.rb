class AdminController < ApplicationController
  def competences
    @groups = CompetenceGroup.all.order(:position)
  end
end
