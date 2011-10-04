class TagsController < ApplicationController
  before_filter :require_user

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => { :tags => @tags} }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    @tag = current_user.tags.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = current_user.tags.build(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, :notice => 'Tag was successfully created.' }
        format.json { render :json => { :tag => @tag, :success => true }, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, :notice => 'Tag was successfully updated.' }
        format.json { render :json => { :success => true } }
        # format.json { head :ok } # <- this is what the rails scaffold generates
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { render :json => { :success => true } }
      # format.json { head :ok } # <- this is what the rails scaffold generates
    end
  end
end
