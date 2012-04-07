class GadgetsController < ApplicationController
  before_filter :get_widget
  before_filter :widget_gadgets, only: [ :index ]
  
  respond_to :json
  
  def json_gadgets
    [ @widget, @gadgets ]
  end
  
  def index
    respond_with(json_gadgets) do |format|
      format.html
    end
  end
  
  def new
    @gadget=@widget.gadgets.new()
  end
  
  def create
    @gadget=@widget.gadgets.new(params[:gadget])
    if @gadget.save
      flash[:success] = "Gadget was successfully created"
      redirect_to widget_gadgets_path
    end
  end
  
  def destroy_multiple
  end
  
  def get_widget
    begin
      @widget = Widget.find(params[:widget_id])
    rescue ActiveRecord::RecordNotFound
      render file: "public/404.html", status: 404
    end
  end

  private
  
  def widget_gadgets
    @widget=Widget.find(params[:widget_id])
    @gadgets=@widget.gadgets unless @widget.gadgets.nil?
  end

  
end