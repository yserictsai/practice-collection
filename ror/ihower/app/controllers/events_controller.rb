class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  def index
    #@events = Event.all
    @events = Event.page(params[:page]).per(5) #分頁 讓資源不會一次龐大讀取
  end

  def new
    @event = Event.new
    render layout: "new"
  end

  def show
    #@event = Event.find(params[:id])
    @page_title = @event.name
  end

  def edit
    #@event = Event.find(params[:id])
  end

  def update
    #@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to :action => :show, :id => @event
    else
      render :action => :edit
    end
    flash[:notice] = "Successfully updated"
  end

  def destroy
    #@event = Event.find(params[:id])
    @event.destroy

    redirect_to :action => :index
    flash[:alert] = "Successfully deleted"
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    flash[:notice] = "Successfully created"
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end


  def set_event
    @event = Event.find(params[:id])
  end

end
