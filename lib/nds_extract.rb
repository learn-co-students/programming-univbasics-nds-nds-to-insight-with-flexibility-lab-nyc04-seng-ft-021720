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


# Your code after this point

def movies_with_director_key(name, movies_collection)
 
  count = 0 
  
  while count < movies_collection.length
    movies_collection[count][:director_name] = name
  
    count += 1 
  end
  
  movies_collection
  
end


def gross_per_studio(collection)
  gross_total = {}
  i = 0 
    while i < collection.length
      current_studio = collection[i][:studio]
      current_movie_gross = collection[i][:worldwide_gross]
        if !gross_total[current_studio]
          gross_total[current_studio] = current_movie_gross
        else
          gross_total[current_studio] += current_movie_gross
        end
      i += 1
    end
  
 gross_total 
 
end




def movies_with_directors_set(source)
  i = 0
  director_arr = []

  while i < source.length do
    director_stats = source[i]
    director_name = director_stats[:name]
    directors_movie_list = director_stats[:movies]
    director_arr << movies_with_director_key(director_name, directors_movie_list)
    i += 1
  end

  director_arr
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
