# Provided, don't edit
require 'directors_database'
require "pry"
require "pp"
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

# def list_of_directors(source)
#   list_of_directors=[ ]
#   row_count = 0
#   while row_count < source.size do
#     list_of_directors<< source[row_count][:name]
#     row_count+=1
#   end
#   list_of_directors
#   # Write this implementation
# end

# def movies_collection(source)
#   movies_collection= []
#   row_count=0
#   while row_count< source.size do 
#     source[row_count][:movies].each do |movie|
#       movies_collection<<{title: movie[:title]}
#     end
#     row_count+=1
#   end
#   movies_collection
# end
def movies_with_director_key(name, movies_collection)
  array=[ ]
  movies_collection.each  do |movie|
    array<< movie_with_director_name(name, movie)
  end
  array 
  # binding.pry 

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
end

def gross_per_studio(collection)
  # binding.pry
  result = { }
  collection.map do |hash|
    if result.has_key?(hash[:studio])
      result[hash[:studio]]+=hash[:worldwide_gross]
    else
      result[hash[:studio]]= hash[:worldwide_gross]
    end
  end
  result 
  # binding.pry
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

def director_movies(hash)
  #{:name => "ABC",
  # :movies => [
  #{:title=> "cd"}, {:title => "ef"}
  #]
#}  
    result = [ ] 
    hash[:movies].map{|each| 
     per_movie = movie_with_director_name(hash[:name], each)
     result<< per_movie} 
    result
end

def movies_with_directors_set(source)
  # binding.pry
  result = [ ] 
  item=0
  while item< source.size do
    result<<  director_movies(source[item])
    item+=1
  end
  result 
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
end
# def directors_database

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  # binding.pry
  return gross_per_studio(movies_with_director_names)
end
