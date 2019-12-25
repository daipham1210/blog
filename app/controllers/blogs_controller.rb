class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  before_action :set_sidebar_topics, except: %i[update create destroy toggle_status]
  layout 'blog'
  access all: %i[show index], user: { except: %i[destroy new create update edit toggle_status] },
         site_admin: :all

  def index
    @blogs = if logged_in?(:site_admin)
               Blog.recent.page(params[:page]).per(5)
             else
               Blog.published.recent.page(params[:page]).per(5)
             end
    @page_title = 'My Portfolio Blog'
  end

  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog    = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @tags    = @blog.tag_list

      @page_title = @blog.title
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: 'You are not authorized to access this page'
    end
  end

  def new
    @tags = Tag.all.map { |u| [u.name, u.name] }
    @blog = Blog.new
  end

  def edit
    @tags = Tag.all.map { |u| [u.name, u.name] }
    @selected_tags = @blog.tags.pluck(:name).join(',')
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your post is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was removed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :description, :body, :topic_id, :status, tag_list: [])
  end

  def set_sidebar_topics
    @topics = Topic.all
  end
end
