class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
    @attachments_json = attachments_to_json(@attachments)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attachments_json }
    end
  end

  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attachment }
    end
  end
  
  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attachment }
    end
  end
  
  def edit
    @attachment = Attachment.find(params[:id])
  end
  
  def create
    @attachment = Attachment.new(params[:attachment])

    respond_to do |format|
      if @attachment.save
        format.html {
          render :json => attachments_to_json([@attachment]),
          :content_type => 'text/html',
          :layout => false
        }
        format.json { 
          render json: attachments_to_json([@attachment]), status: :created, location: @attachment 
        }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url }
      format.json { head :no_content }
    end
  end

  private
  def attachments_to_json attachments
    (attachments.map {|attachment| 
      attachment.attributes.merge({
        "url" => attachment.file.url(:original),
        "thumbnail_url" => attachment.file.url(:thumb)
        })
      }
    ).to_json
  end
end
