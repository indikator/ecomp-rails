class CompetencesController < ApplicationController
  def index
    @competence_groups = CompetenceGroup.all.where(visible: true, deleted: false).order(:position)
  end
end