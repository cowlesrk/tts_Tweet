class TwerksController < ApplicationController

  before_action :set_twerk, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  def index
    @twerks = Twerk.all
  end

  def show

  end

  def edit
  end

  def new
    @twerk = Twerk.new
  end

  def create
    @twerk = Twerk.new(twerk_params)

    respond_to do |format| 
      if @twerk.save
        format.html { redirect_to @twerk, notice: "Nice Twerking." }
      else
        format.html { render :new}
      end
    end
  end

def update
  respond_to do |format|
    if @twerk.update(twerk_params)
      format.html { redirect_to @twerk, notice: 'That Twerk is fresh.'}
    else
      format.html { render :edit}
    end
  end
end

def destroy
  @twerk.destroy
  respond_to do |format|
    format.html { redirect_to twerks_url, notice: 'That Twerk was wack.'}
  end
end

private 

def set_twerk
  @twerk = Twerk.find(params[:id])
end

def twerk_params
  params.require(:twerk).permit(:message, :user_id)
end



end
