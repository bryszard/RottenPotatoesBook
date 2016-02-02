class ReviewsController < ApplicationController
    before_filter :has_moviegoer_and_movie, :only => [:new, :create]
    
    protected
    
    def has_moviegoer_and_movie
        unless @current_user
            flash[:warning] = 'You must be logged in to create a review.'
            redirect_to movies_path
        end
        unless (@movie = Movie.find_by_id(params[:movie_id]))
        flash[:warning] = 'Review must be for an existing movie.'
        redirect_to movies_path
        end
    end
    
    public
    
    def new
        # new sets movie_id foreign key automatically
        @review ||= @movie.reviews.new
    end
    
    def create
        #@movie = Movie.find(params[:movie_id])
        @current_user.reviews << @movie.reviews.build(params[:review])
        # review.moviegoer = @current_user
        redirect_to movie_path(@movie)
    end
    

end
