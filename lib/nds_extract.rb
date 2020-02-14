# Provided, don't edit
require 'directors_database'

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


def movies_with_director_key(name, movies_collection)
  movies = []
 counter = 0
while counter < movies_collection.length do
  movie_data = movies_collection[counter]
  movies << movie_with_director_name(name,movie_data)
  counter += 1
end
movies
end

def gross_per_studio(collection)
  result = {}
  i = 0

  while i < collection.length do
    movie = collection[i]

    if !result[movie[:studio]]
      result[movie[:studio]] = movie[:worldwide_gross]
    else
      result[movie[:studio]] += movie[:worldwide_gross]
    end
    i += 1
  end

  result
end

def movies_with_directors_set(source)
 counter = 0
  a_o_a_movies_by_dir = []

  while counter < source.length do
    dir_info_hash = source[counter]
    director_name = dir_info_hash[:name]
    directors_movies = dir_info_hash[:movies]
    a_o_a_movies_by_dir << movies_with_director_key(director_name, directors_movies)
    counter += 1
  end
  a_o_a_movies_by_dir
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
