class MoviesController < ApplicationController
    
    def index
        @movies = Movie.all.sort_by { |m| m.title }
    end

    def show
        begin
        id = params[:id]
        @movie = Movie.find(id)
        rescue ActiveRecord::RecordNotFound
            redirect_to movies_path
        end
    end
    
    def new
        # render a form - 'new' template
    end
    
    def create
        @movie = Movie.create!(params[:movie])
        flash[:notice] = "#{@movie.title} has been successfully created."
        redirect_to movie_path(@movie)
    end
    
    def edit
        @movie = Movie.find params[:id]
    end
    
    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes!(params[:movie])
        flash[:notice] = "#{@movie.title} was successfully updated."
        respond_to do |client_wants|
            client_wants.html { redirect_to movie_path(@movie) }
            client_wants.xml { render :xml => @movie.to_xml }
        end
    end
    
    def destroy
        @movie = Movie.find params[:id]
        @movie.destroy
        flash[:notice] = "#{@movie.title} was successfully deleted."
        redirect_to movies_path
    end
end