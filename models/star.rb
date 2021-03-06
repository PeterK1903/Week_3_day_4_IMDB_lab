require_relative('../db/sql_runner.rb')

class Star

attr_accessor :first_name, :last_name
attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
end

def save()
  sql = "INSERT INTO stars
        (first_name, last_name)
        VALUES
        ($1,$2)
        RETURNING id"
  values = [@first_name, @last_name]
  star = SqlRunner.run(sql, values).first
  @id = star['id'].to_i
end

def update()
  sql = "UPDATE stars
        SET
        (first_name, last_name)
        = ($1,$2)
        WHERE id = $3"
  values = [@first_name, @last_name, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE from stars;"
  SqlRunner.run(sql)
end

def movies()
  sql = "SELECT movies.*
        FROM movies INNER JOIN castings
        ON movie_id = castings.movie_id
        WHERE star_id = $1"
  values = [@id]
  movies_data = SqlRunner.run(sql, values)
  movies = movies_data.map {|movies_data| Movie.new(movies_data)}
  return movies
end


end
