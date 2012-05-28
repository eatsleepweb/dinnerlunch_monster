class LunchToDinnersController < ApplicationController
  # GET /lunch_to_dinners
  # GET /lunch_to_dinners.xml
  def index
    @lunch_to_dinners = LunchToDinner.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lunch_to_dinners }
    end
  end

  # GET /lunch_to_dinners/1
  # GET /lunch_to_dinners/1.xml
  def show
    @lunch_to_dinner = LunchToDinner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lunch_to_dinner }
    end
  end

  # GET /lunch_to_dinners/new
  # GET /lunch_to_dinners/new.xml
  def new
    @lunch_to_dinner = LunchToDinner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lunch_to_dinner }
    end
  end

  # GET /lunch_to_dinners/1/edit
  def edit
    @lunch_to_dinner = LunchToDinner.find(params[:id])
  end

  # POST /lunch_to_dinners
  # POST /lunch_to_dinners.xml
  def create
    @lunch_to_dinner = LunchToDinner.new(params[:lunch_to_dinner])

    respond_to do |format|
      if @lunch_to_dinner.save
        format.html { redirect_to(@lunch_to_dinner, :notice => 'LunchToDinner was successfully created.') }
        format.xml  { render :xml => @lunch_to_dinner, :status => :created, :location => @lunch_to_dinner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lunch_to_dinner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lunch_to_dinners/1
  # PUT /lunch_to_dinners/1.xml
  def update
    @lunch_to_dinner = LunchToDinner.find(params[:id])

    respond_to do |format|
      if @lunch_to_dinner.update_attributes(params[:lunch_to_dinner])
        format.html { redirect_to(@lunch_to_dinner, :notice => 'LunchToDinner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lunch_to_dinner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lunch_to_dinners/1
  # DELETE /lunch_to_dinners/1.xml
  def destroy
    @lunch_to_dinner = LunchToDinner.find(params[:id])
    @lunch_to_dinner.destroy

    respond_to do |format|
      format.html { redirect_to(lunch_to_dinners_url) }
      format.xml  { head :ok }
    end
  end
end
