class GadgetsController < ApplicationController
  before_filter :get_widget
  before_filter :widget_gadgets, only: [ :index ]
  before_filter :ensure_parent,   only: [ :destroy, :destroy_multiple ]
  
  respond_to :json, :html, :js
  
  def json_gadgets
    [ @widget, @gadgets ]
  end
  
  def index
    respond_with(json_gadgets) do |format|
      format.html
    end
  end
  
  def new
    @gadget = @widget.gadgets.new()
    respond_to do |format|
      #format.html # new.html.erb
      format.json { render json: @gadget }
      format.js
    end
  end
  
  def edit
    @gadget=(params[:widget][:gadget_id])
  end
  
  def create
    @gadget = @widget.gadgets.new(params[:gadget])
    respond_with(@gadget) do |format|
      if @gadget.save
        format.js { }
        format.json { }
      else
        #format.html { render action: "new" }
        format.json { render json: @gadget.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
  def update
    @gadget=@widget.gadgets.find(params[:id])
    if @gadget.update_attributes(params[:gadget])
      respond_to do |format|
        format.html
        format.json { respond_with_bip(@gadget) }
      end
    else
       respond_to do |format|
         format.html { render :action => "edit" }
         format.json { respond_with_bip(@gadget) }
       end
    end
  end
  
  def destroy_multiple
    gadget_ids=(params[:gadget_ids])
    to_delete=[]
    gadget_ids.split(',').each do |gadget_id|
      to_delete.push(Gadget.find(gadget_id))
    end
    puts gadget_ids
    to_delete.each do |del|
      del.destroy()
    end
    flash.now[:success] = "Prequals Destroyed Successfully"
    respond_to do |format|
      format.html { redirect_to widget_gadgets_path(@widget) }
      format.json { render :json => to_delete.to_json }
    end
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
  
  def ensure_parent
    #verify that user can only delete gadgets belonging to this specific widget
    @gadgets = @widget.gadgets.find_by_id(params[:gadget_ids])
    redirect_to root_path, :notice => "Gadgets must belong to this widget" unless ! @gadgets.nil?
  end
  
  protected
  def find_gadget
    @gadget = @widget.gadgets.find_by_id(params[:id])
  end

  
end
