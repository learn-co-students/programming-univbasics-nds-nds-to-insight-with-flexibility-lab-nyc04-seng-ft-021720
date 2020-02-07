# Provided, don't edit
require 'directors_database'
require 'pp'

# pp directors_database
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  # first get all movies for that director name using director database 
  # for each movie and for each movie in movie collection, match the title
  # with that movie fill out the rest of the information needed to return
  
  result = []
  movie_index = 0
  inner_hash = {}

  while movie_index < movies_collection.length do
    # inner_hash[:director_name] = name
    inner_hash[:title] = movies_collection[movie_index][:title]
    result.push(movie_with_director_name(name, inner_hash))
    movie_index += 1
    inner_hash = {}
  end
  result
end


def gross_per_studio(collection)

  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  #
  # go through each item in the array
  # if the studio is already in the array, add the gross to that studio's total. 
  # if not, add it to the array
  result = {}
  movie_index = 0
  while movie_index < collection.length do
    studio_name = collection[movie_index][:studio]
    movie_gross = collection[movie_index][:worldwide_gross]
    if !result[studio_name]
      result[studio_name] = movie_gross
    else
      result[studio_name] += movie_gross
    end
    movie_index += 1
  end
  result
end

def movies_with_directors_set(source)
  #pp source[0][:movies]
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  # { :name => "A", :movies => [{ :title => "Test" }] }
          # becomes... [[{:title => "Test", :director_name => "A"}], ...[], ... []]
  director_index = 0
  result = []
  while director_index < source.length do
    movie_index = 0
    name = source[director_index][:name]
    while movie_index < source[director_index][:movies].length do
      inner_hash = {}
      inner_array = []
      movie_gross = source[director_index][:movies][movie_index][:worldwide_gross]
      studio = source[director_index][:movies][movie_index][:studio]
      inner_hash[:title] = source[director_index][:movies][movie_index][:title]
      inner_hash[:worldwide_gross] = movie_gross
      inner_hash[:director_name] = name
      inner_hash[:studio] = studio
      inner_array.push(inner_hash)
      result.push(inner_array)
      movie_index += 1
    end
    director_index += 1
  end
  return result 
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  pp a_o_a_movies_with_director_names
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end

# pp directors_database