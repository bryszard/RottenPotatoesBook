class MoviesController < ApplicationController
    
=begin    
    def movies_with_filters
        @movies = Movie.with_good_reviews(params[:threshold])
        @movies = @movies.for_kids if params[:for_kids]
        @movies = @movies.with_many_fans if params[:with_many_fans]
        @movies = @movies.recently_reviewed if params[:recently_reviewed]
    end
=end

    def movies_with_filters
        @movies = Movie.with_good_reviews(params[:threshold])
        %w(for_kids recently_reviewed).each do |filter|
            @movies = @movies.send(filter) if params[filter]
        end
    end
    
    def index
        @movies = Movie.all.sort_by { |m| m.title }
    end

    def show
        begin
        id = params[:id]
        @movie = Movie.find(id)
        render(:partial => 'movie', :object => @movie) if request.xhr?
        rescue ActiveRecord::RecordNotFound
            redirect_to movies_path
        end
    end
    
    
    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(params[:movie])
        if @movie.save
            flash[:notice] = "#{@movie.title} has been successfully created."
            redirect_to movie_path(@movie)
        else
            render 'new' # 'new' template can access @movie field values (as in edit)
        end
    end
    
    def edit
        @movie = Movie.find params[:id]
    end
    
    def update
        @movie = Movie.find params[:id]
        if @movie.update_attributes(params[:movie])
            flash[:notice] = "#{@movie.title} was successfully updated."
            respond_to do |client_wants|
                client_wants.html { redirect_to movie_path(@movie) }
                client_wants.xml { render :xml => @movie.to_xml }
            end
        else
            render 'edit'
        end
    end
    
    def destroy
        @movie = Movie.find params[:id]
        @movie.destroy
        flash[:notice] = "#{@movie.title} was successfully deleted."
        redirect_to movies_path
    end
end