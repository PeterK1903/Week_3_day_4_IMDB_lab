require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require('pry')

Movie.delete_all
Star.delete_all
Casting.delete_all

movie1 = Movie.new({'title' => 'Exit Wounds', 'genre' => 'Action'})
movie1.save()
# movie1.genre = "Gang$ta"
# movie1.update

movie2 = Movie.new({'title' => 'RoboCop', 'genre' => 'Grindhouse'})
movie2.save()
# movie3 = Movie.new({'title' => 'Frozen', 'genre' => 'Comedy Musical'})
#
star1 = Star.new({'first_name' => 'Earl', 'last_name' => 'Simmons'})
star1.save()
star1.first_name = 'DMX'
# star1.update()
star2 = Star.new({'first_name' => 'Steven', 'last_name' => 'Seagal'})
star2.save
# star3 = Star.new({'first_name' => 'Josh', 'last_name' => 'Gad'})
#
casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '10000'})
casting1.save()
# casting2 = Casting.new({'movie_id', => movie1.id, 'star_id' => star2.id, 'fee' => '50000'})
# casting3 = Casting.new({'movie_id', => movie3.id, 'star_id' => star3.id, 'fee' => '500000'})

binding.pry
nil
