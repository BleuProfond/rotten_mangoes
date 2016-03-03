class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    if params[:duration] && params[:search]
      if params[:duration] == "1"
        @movies = Movie.search(params[:search]).where("runtime_in_minutes < ?", 90)
      elsif params[:duration] == "2"
        @movies = Movie.search(params[:search]).where("runtime_in_minutes > ? and runtime_in_minutes < ? ", 90, 120)
      else
        @movies = Movie.search(params[:search]).where("runtime_in_minutes > ?", 120)
      end
    elsif params[:search]
      @movies = Movie.search(params[:search])
    elsif params[:duration]      
      if params[:duration] == "1"
        @movies = Movie.where("runtime_in_minutes < ?", 90)
      elsif params[:duration] == "2"
        @movies = Movie.where("runtime_in_minutes > ? and runtime_in_minutes < ? ", 90, 120)
      else
        @movies = Movie.where("runtime_in_minutes > ?", 120)
      end
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end 
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end   
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  # def duration_to_boolean(choice)
  #   case choice
  #   when 1
  #     choice < 90
  #   when 2
  #     choice > 90 && choice < 120
  #   when 3
  #     choice > 120
  #   end  
  # end

  protected

  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image_url, :release_date)
  end

end
