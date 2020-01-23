require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies
    (title, genre)
    VALUES
    ($1,$2)
    RETURNING id"
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def update()
    sql = "UPDATE movies
          SET
          (title, genre)
          = ($1,$2)
          WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE from movies;"
    SqlRunner.run(sql)
  end

  def stars()
    sql = "SELECT stars.*
          FROM stars INNER JOIN castings
          ON star_id = castings.star_id
          WHERE movie_id = $1"
    values = [@id]
    stars_data = SqlRunner.run(sql, values)
    stars = stars_data.map {|stars_data| Star.new(stars_data)}
    return stars
  end


end
