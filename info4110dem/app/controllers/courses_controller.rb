class CoursesController < ApplicationController
  def index
    client = authorize
    client.materialize("Course__c")
    @Courses = Course__c.all
  end


  # GET /Courses/1
  # GET /Courses/1.json
  def show
    client = authorize
    client.materialize("Course__c")
    @Course = Course__c.find(params[:id])    

  end

  # GET /Courses/new
  # GET /Courses/new.json
  def new
    client = authorize
    client.materialize("Course__c")
    
    @Course = Course__c.new
    @Course.OwnerId = '005E0000001T9Nv'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @Course }
    end
  end

  # GET /Courses/1/edit
  def edit
    client = authorize
    client.materialize("Course__c")

    @Course = Course__c.find(params[:id])
  end

  # POST /Courses
  # POST /Courses.json
  def create

    @Course = Course__c.new(params[:Course])
    @Course.OwnerId = '005G0000002idhcIAA'
  
    if @Course.save
      redirect_to course_path(@Course), :notice => 'Course was successfully created.'
    else
      format.html { render :action => "new" }
    end
  
  end

  # PUT /Courses/1
  # PUT /Courses/1.json
  def update
    @Course = Course__c.find(params[:id])

    begin
      @Course.update_attributes Course__c.coerce_params(params[:Course])
    rescue Databasedotcom::SalesForceError => e
      puts 'Issue updating with record'
    end

    redirect_to Course_path(@Course), :notice => 'Course was successfully updated.' 
  end



  # DELETE /Courses/1
  # DELETE /Courses/1.json
  def destroy
    @Course = Course__c.find(params[:id])
    @Course.destroy

    respond_to do |format|
      format.html { redirect_to Courses_url }
      format.json { head :no_content }
    end
  end
end