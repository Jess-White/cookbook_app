class Api::RecipesController < ApplicationController
  

  def index
    search_term = params[:search]
    @recipes = Recipe.where("ingredients iLIKE ? OR ingredients iLIKE ?", "%#{search_term }%", "%#{search_term }%")
    render 'index.json.jb'
  end 

  def create
    @recipe = Recipe.new(
                          title: params[:title],
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:directions],
                          prep_time: params[:prep_time]
                          )
    @recipe.save
    render "show.json.jb"
  end 

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jb'
  end 

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time

    @recipe.save
    render 'show.json.jb'
  end 

  def delete
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    @recipe.save
    render json: {message: "Recipe #{@recipe.id} successfully destroyed"}
  end 
end


