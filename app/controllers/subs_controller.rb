class SubsController < ApplicationController
  before_action :require_signed_in!

  def new
    @sub = Sub.new
    5.times { @sub.links.new }
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)

    filtered_link_params = link_params
    .reject {|hash| hash.values.all?(&:blank?) }
    .map { |hash| hash.merge!({submitter_id: current_user.id}) }

    @sub.links.new(filtered_link_params)

    if @sub.save
      flash[:notices] = ["Sub created!"]
      redirect_to sub_url(@sub)
    else
      flash.now[:notices] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    mod_id = User.find_by(username: params[:sub][:mod_name]).id
    if @sub.update(name: params[:sub][:name], mod_id: mod_id)
      flash[:notices] = ["Sub updated!"]
      redirect_to sub_url(@sub)
    else
      flash.now[:notices] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    flash[:notices] = ["Sub destroyed!"]
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:name)
  end

  def link_params
    params.permit(:links => [:title, :url, :body])
    .require(:links)
    .values
  end

end


