class IngredientsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @ingredient = Ingredient.new
   
  end

  def index
    @ingredients = Ingredient.all
     if user_signed_in?
      redirect_to :controller=>'ingredients', :action =>'new'
    end
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    
    redirect_to ingredient
  end

  def show
     @ingredient = Ingredient.find(params[:id])
     response = Typhoeus.get("http://api.yummly.com/v1/api/recipes?_app_id=ffdd32f5&_app_key=dd268f25fe5a30f7c1821def3698bf46&allowedIngredient[]=#{@ingredient.name}")
     @parse = JSON.parse(response.body)
     size = @parse['matches'].size
     @recipe = @parse['matches'][rand(size)]
  end

  def details
    @id = params[:id]  
    response = Typhoeus.get("http://api.yummly.com/v1/api/recipe/#{@id}?_app_id=ffdd32f5&_app_key=dd268f25fe5a30f7c1821def3698bf46")
    #binding.pry
    @detail = JSON.parse(response.body)
    
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
