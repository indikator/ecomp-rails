class CompetencesController < ApplicationController
  def index
    @competence_groups = CompetenceGroup.all.where(visible: true).order(:position)
  end
end