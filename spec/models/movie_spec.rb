require 'rails_helper'

RSpec.describe Movie, type: :model do
    
    describe 'searching Tmdb by keyword' do
        
        context 'with valid API key' do    
            it 'searching Tmdb with a keyword' do
                expect(Tmdb::Movie).to receive(:find).with('Inception')
                Movie.find_in_tmdb('Inception')
            end
        end
        
        context 'with invalid API key' do
            it 'should raise an InvalidKeyError' do
                allow(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
                allow(Tmdb::Api).to receive(:response).and_return({'code' => 401})
                expect { Movie.find_in_tmdb('Inception') }.to raise_error(Movie::InvalidKeyError)
            end    
        end
    end
end



    
=begin
        fixtures :movies
        it 'should include rating and year in full name' do
            movie = movies(:milk_movie)
            movie.name_with_rating.should == 'Milk (R)'
        end
  
        subject { build :movie, :title => 'Milk', :rating => 'R' }
        its(:name_with_rating) { should == 'Milk (R)' }
        
        # 'build' creates but doesn't save object; 'create' also saves it
        movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
        movie.name_with_rating.should == 'Milk (R)'
  
=end