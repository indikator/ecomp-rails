class AdminController < ApplicationController
  def competences
    @groups = CompetenceGroup.all.order(:position)
  end

  def new_competence_group
    @group = CompetenceGroup.new
    @group.color = Color.find_by_name("Asbestos")

    @group.position = params[:position].to_i + 1

    respond_to do |format|
      format.html { render partial: "admin/competence_group", locals: {group: @group } }
      format.js { render partial: "admin/competence_group", locals: {group: @group } }
    end
  end
end
