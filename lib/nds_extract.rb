# Provided, don't edit
require 'directors_database'
require 'pp'

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

 i = 0
 results_array = []

  while i < movies_collection.length
    movies_collection[i][:director_name] = name
  
    results_array.push(movies_collection[i])
    i += 1
  end
  results_array
end


def gross_per_studio(collection)
  
  result = {}
  i = 0
  
  while i < collection.length do
    studio_name = collection[i][:studio]
    profit = collection[i][:worldwide_gross]
     
      if !result[studio_name]  
      result[studio_name] = profit
      
      else
        result[studio_name] += profit
      end
    i += 1
  end
result
  
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
end

def movies_with_directors_set(source)

  i = 0
  director_catalogue_array = []
  
  while i < source.length do
    name = source[i][:name]
    movies_collection = source[i][:movies]
   
      director_catalogue = movies_with_director_key(name, movies_collection)
  
      director_catalogue_array.push(director_catalogue)
      i += 1
      
  end
 director_catalogue_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
