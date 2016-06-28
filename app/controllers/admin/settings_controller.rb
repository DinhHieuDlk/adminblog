class Admin::SettingsController < Admin::ApplicationController
  def new
    if Setting.any?
      redirect_to edit_admin_setting_url(Setting.first)
    else
      @setting = Setting.new
    end

  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to edit_admin_setting_url(@setting), notice:"successfully created setting"
    else
      flash[:notice] = "errors created..."
      render "new"
    end
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    @setting.update(setting_params)
    redirect_to edit_admin_setting_path(@setting), notice:"successfully update setting"
  end
  private
  def setting_params
    params.require(:setting).permit(:id, :site_name, :post_per_page, :under_maintenance, :prevent_commenting, :tag_visibility)
    #code
  end
end
