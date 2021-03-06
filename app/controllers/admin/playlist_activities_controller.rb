class Admin::PlaylistActivitiesController < Admin::ResourceController
  def index
    @student = Student.find(params[:student_id])
    super
  end

  def new
    @student = Student.find(params[:student_id])
    @focus_areas = FocusArea.where(grove_id: @student.grove_id)
    @activities = Activity.where(grove_id: @student.grove_id)
    @resource = @student.playlist_activities.new
    authorize(resource)
    respond_with resource
  end

  def edit
    @student = Student.find(params[:student_id])
    @focus_areas = FocusArea.where(grove_id: @student.grove_id)
    @activities = Activity.where(grove_id: @student.grove_id)
    respond_with resource
  end

  private
    def resource_as_sym
      :playlist_activity
    end

    def whitelist
      [:activity_id, :focus_area_id]
    end

    def build_resource
      @student = Student.find(params[:student_id])
      @resource = @student.playlist_activities.new(permitted_params)
    end

    def after_save_path_for(resource)
      admin_student_playlist_path(resource.student)
    end

    def collection
      PlaylistActivity.where(user_id: params[:student_id])
                      .order(id: :asc)
    end
end
