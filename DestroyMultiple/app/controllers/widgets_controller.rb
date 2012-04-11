class WidgetsController < ApplicationController
  before_filter :find_widgets, only: [:index]
  before_filter :find_widget, only: [ :show ]
  before_filter :find_gadgets, only: [ :show ]
  before_filter :ensure_parent,   only: [ :destroy, :destroy_multiple ]
  
  respond_to :json, :html, :js
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @widgets }
    end
  end

  def show
    respond_to do |format|
      format.html {redirect_to widget_gadgets_path(@widget)}
      format.json { render json: @widget }
    end
  end

  def new
    @widget = Widget.new
    respond_to do |format|
      #format.html # new.html.erb
      format.json { render json: @widget }
      format.js
    end
  end

  def edit
    @widget = Widget.find(params[:id])
  end

  def create
    @widget = Widget.new(params[:widget])
    respond_with(@widget) do |format|
      if @widget.save
        format.js { }
        format.json { }
      else
        #format.html { render action: "new" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @widget = Widget.find(params[:id])
    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        format.html { redirect_to @widget, notice: 'Widget was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to widgets_url }
      format.json { head :ok }
    end
  end
  
  private
  def find_widgets
    @widgets = Widget.all
  end
  
  def find_widget
    @widget = Widget.find(params[:id])
  end
  
  def find_gadgets
    @gadgets = @widget.gadgets unless @widget.gadgets.nil?
  end
  
  def ensure_parent
    #verify that user can only delete gadgets belonging to this specific widget
    @gadgets = @widget.gadgets.find_by_id(params[:gadget_ids])
    redirect_to root_path, :notice => "Gadgets must belong to this widget" unless ! @gadgets.nil?
  end
  
end
