class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.active
    @readytasks = @tasks.ready
    @progresstasks = @tasks.inprogress.order(:updated_at)
    @completedtasks = @tasks.completed.order(:updated_at)
    @testedtasks = @tasks.tested.order(:updated_at)
    @deployedtasks = @tasks.deployed.order(:updated_at)
    if Task.last.nil?
      @current_sprint = Time.now.strftime("%U%Y").to_i
    else  
      @current_sprint = @tasks.last.sprint_number
    end  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to stories_tasks_path, :notice => 'Task was successfully created.' }
        #format.json { render :json => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to tasks_url, :notice => 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  #PUT /task/update/status
  def update_position
    task = Task.find(params[:id])
    newstatus = params[:status].to_i      
    logger.debug(newstatus)
    if newstatus == 2 && task.wip_started_date.nil?
      task.wip_started_date = Time.now
    elsif newstatus == 3
      task.completed_at = Time.now 
    elsif newstatus == 4
      task.tested_at = Time.now 
    elsif newstatus == 5
      task.deployed_at = Time.now 
    end
    if newstatus != task.status
      task.status = newstatus
      task.save
      respond_to do |format|
        format.html {redirect_to :back}
      end
    else
      respond_to do |format|
        format.html {redirect_to :back}
      end
    end     
  end
  
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def archived
    @task = Task.find(params[:id])
    @task.update_attributes(:archived => true)

    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end
  
  def generate_sprint_number
    @task = Task.find(params[:id])
    sprint_number = Time.now.strftime("%U%Y").to_i
    estimate = params[:estimate][:estimate_a]
    person_id = params[:person][:person_id]
    @task.update_attributes(:sprint_number => sprint_number, :estimate => estimate ,:person_id => person_id)

    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end
  
  def stories
    @tasks = Task.future
  end
  
  def ongoing
    @tasks = Task.active
    @readytasks = @tasks.ready
    @progresstasks = @tasks.inprogress.order(:updated_at)
    @completedtasks = @tasks.completed.order(:updated_at)
    @testedtasks = @tasks.tested.order(:updated_at)
    @deployedtasks = @tasks.deployed.order(:updated_at)
    if Task.last.nil?
      @current_sprint = Time.now.strftime("%U%Y").to_i
    else  
      @current_sprint = @tasks.last.sprint_number
    end  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end
  
  def archived
    @tasks = Task.archived
  end        
end
