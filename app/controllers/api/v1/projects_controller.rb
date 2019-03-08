module Api::V1
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :update, :destroy]

    def index
      @projects = Project.order(:id)

      render json: @projects
    end

    def new
      new_project = BillsService.new(project_params[:ext_id]).get_new_project

      render json: new_project
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        render json: @project, status: :created
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
    end

    private
      def set_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:ext_id)
      end
  end
end
