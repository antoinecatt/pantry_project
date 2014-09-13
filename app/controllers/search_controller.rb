class SearchController < ApplicationController
   def search
    @search = SimpleSearch.new SimpleSearch.get_params(params)
    if @search.valid?
      @ingredients = @search.search_within Track.all, :title
    end
  end
end
