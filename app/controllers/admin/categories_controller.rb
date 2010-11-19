class Admin::CategoriesController < Admin::AdminController
  def index
    @categories = Category.all
    respond_with @categories
  end

  def new
    @category = Category.new
    respond_with @category
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:post_category])
    flash[:notice] = 'Category was successfully created.' if @category.save
    respond_with @post, :location => admin_categories_path
  end

  def update
    @category = Category.find(params[:id])
    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params[:post_category])
    respond_with @category, :location => admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with @category, :location => admin_categories_path
  end
end