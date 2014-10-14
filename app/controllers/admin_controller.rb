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

  def update_competence_groups
    groups = params[:groups]

    groups.each do |key, group|
      CompetenceGroup.update(group["id"].to_i, color_id: group["color"].to_i, position: group["position"].to_i, name: group["name"])
    end

    render text: "success"
  end
end
