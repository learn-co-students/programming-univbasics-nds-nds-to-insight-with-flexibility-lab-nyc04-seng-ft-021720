require 'spec_helper'

describe 'provided method' do
  describe 'flatten_a_o_a' do
    it 'flattens an a_a_a of Integers' do
      expect(flatten_a_o_a([[1,2],[3,4,5],[6]])).to eq([1,2,3,4,5,6])
    end
  end

  describe 'movie_with_director_name' do
    it "creates a new movie Hash with director's name provided" do
      director_name = "Byron Poodle"
      movies_coll = {
        :worldwide_gross => 2,
        :release_year => 2014,
        :studio => "Karbit Poodles",
        :title => "The Fire Hydrant of Doom"
      }
      new_movie = movie_with_director_name(director_name, movies_coll)

      expect(new_movie[:director_name]).to eq(director_name)
    end
  end
end

describe 'movies_with_director_key' do
  it 'adds a :director_name key an AoH of movies' do
    dir_name = "Byron Poodle"
    test_set = [{:title => "TestA"}, {:title => "TestB"}]
    updated_movies = movies_with_director_key(dir_name, test_set)
    expect(updated_movies[0][:director_name]).to eq(dir_name), "Should add director name to each movie Hash"
    expect(updated_movies[1][:director_name]).to eq(dir_name), "Should add director name to each movie Hash"
  end
end



describe 'gross_per_studio' do
  it 'collects each movie based on the studio key' do
    test_data = [
      { :title => "Movie A", :studio => "Alpha Films", :worldwide_gross => 10 },
      { :title => "Movie B", :studio => "Alpha Films", :worldwide_gross => 30 },
      { :title => "Movie C", :studio => "Omega Films", :worldwide_gross => 30 }
    ]
    result = gross_per_studio(test_data)
    expect(result["Alpha Films"]).to eq(40), "We should collect the totals of films made by this Alpha Films"
    expect(result["Omega Films"]).to eq(30), "We should collect the totals of films made by this Omega Films"
  end
end


