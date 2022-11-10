class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    list_id = @list.id
    @bookmarks = Bookmark.select { |bookmark| bookmark.list_id == list_id }
    @movies = []
    @bookmarks.each do |bookmark|
      @movies.push(Movie.select { |movie| movie.id == bookmark.movie_id })
    end
    # raise
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
