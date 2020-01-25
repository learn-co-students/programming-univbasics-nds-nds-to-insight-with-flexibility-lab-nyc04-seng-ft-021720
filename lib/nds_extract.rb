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

def movies_with_director_key(name, movies_collection)
  movie_array = []
  index=0
  while index < movies_collection.length do
    movie_array.push(movie_with_director_name(name, movies_collection[index]))
    index+=1
  end
  movie_array
end

def movies_with_directors_set(source)
  directors_name_array = []
  index = 0
  while index < source.length do
    directors_name_array.push(movies_with_director_key(source[index][:name], source[index][:movies]))
    index+=1
  end
  directors_name_array
end

def gross_per_studio(collection)
  studio_gross = {}
  index = 0
  while index < collection.length do
    if !studio_gross[collection[index][:studio]]
      studio_gross[collection[index][:studio]] = collection[index][:worldwide_gross]
    else
      studio_gross[collection[index][:studio]] += collection[index][:worldwide_gross]
    end
    index+=1
  end
  studio_gross
end


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
