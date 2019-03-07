class RecipesController < ApplicationController
  include VerificationConcern
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find_by_id(params[:id])
  end
 
  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end
  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe was successfully created."
      redirect_to @recipe
    else
      flash[:danger] = "Failed to create recipe."
      render 'new'
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "recipe was successfully updated."
      redirect_to @recipe  
    else
      flash[:danger] = "Failed to update recipe."
      render 'edit'
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    render 'delete'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :prep_time, :cook_time, :servings, ingredients_attributes: [:id, :item, :_destroy], steps_attributes: [:id, :description, :_destroy])
    end


end
