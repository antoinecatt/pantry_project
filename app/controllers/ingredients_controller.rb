class IngredientsController < ApplicationController
  
  def new
    @ingredient = Ingredient.new
  end

  def index
    @ingredients = Ingredient.all
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    ingredient.save
    redirect_to ingredient
  end

  def show
     @ingredient = Ingredient.find(params[:id])
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    ingredient.delete
    redirect_to ingredients_path
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
