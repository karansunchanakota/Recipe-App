class IngredientsController < ApplicationController
  include VerificationConcern
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "ingredient was successfully created."
      redirect_to @ingredient
    else
      flash[:danger] = "Failed to create ingredient."
      render 'new'
    end
  end

  # GET /ingredients/:id/edit
  def edit
    @ingredient = Ingredient.find_by title: params[:title]
  end

  # PUT /ingredients/:id
  def update
    if @ingredient.update(ingredient_params)
      flash[:success] = "ingredient was successfully updated."
      redirect_to @ingredient  
    else
      flash[:danger] = "Failed to update ingredient."
      render 'edit'
    end
  end

  # DELETE /ingredients/:id
  def destroy
    @ingredient.destroy
    render 'delete'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find_by title: params[:title]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:id, :recipe_id, :item)
    end
    
    def new_recipe
      recipe.ingredient=@ingredient
    end
end
