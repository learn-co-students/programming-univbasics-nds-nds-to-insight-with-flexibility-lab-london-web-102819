# Provided, don't edit
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'pp'
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
  movies_collection.each do |movie|
    movie[:director_name] = name
  end
  movies_collection
end


def gross_per_studio(collection)
  result = {}
  collection.each do |movie|
    if result[movie[:studio]]
      result[movie[:studio]] += movie[:worldwide_gross]
    else
      result[movie[:studio]] = movie[:worldwide_gross]
    end
  end
  result
end

def movies_with_directors_set(source)
  movies = []
  source.each do |director|
    director[:movies].each do |movie|
      movie[:director_name] = director[:name]
    end
    movies.push(director[:movies])
  end
  movies
end


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
