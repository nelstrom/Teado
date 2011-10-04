class TasksController < ApplicationController
  before_filter :require_user

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => { :tasks => @tasks} }
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
    @task = current_user.tasks.build

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
    @task = current_user.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, :notice => 'Task was successfully created.' }
        format.json { render :json => { :task => @task, :success => true }, :status => :created, :location => @task }
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
        format.html { redirect_to @task, :notice => 'Task was successfully updated.' }
        format.json { render :json => { :success => true } }
        # format.json { head :ok } # <- this is what the rails scaffold generates
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
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
      format.json { render :json => { :success => true } }
      # format.json { head :ok } # <- this is what the rails scaffold generates
    end
  end
end
