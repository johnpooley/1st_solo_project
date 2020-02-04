require_relative('../db/sql_runner.rb')


class Artist


  attr_accessor :name, :date_of_birth, :alive
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @alive = options['alive']
  end

  # ###################################
  # CRUD

  # create

  def save()
    sql = "INSERT INTO artists (name, date_of_birth, alive)
    VALUES ($1,$2,$3)
    RETURNING id"
    values = [@name, @date_of_birth, @alive]
    artist = SqlRunner.run(sql, values).first
    @id = artist['id'].to_i
  end

  # read

  def self.all()
    sql = "SELECT artists.* FROM artists"
    artists = SqlRunner.run(sql)
    results = artists.map{|artist| Artist.new(artist)}
    return results
  end

  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results.first)
  end

  # update

  def update()
    sql = "UPDATE artists SET(name, date_of_birth, alive)
    = ($1,$2,$3) WHERE id = $4"
    values = [@name, @date_of_birth, @alive, @id]
    SqlRunner.run(sql, values)
  end

  # delete

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  ########################################################

  def artworks()
    sql = "SELECT * FROM artworks WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    works = results.map{|art| Artwork.new(art)}
    return works
  end

  def is_alive()
    sql = "SELECT alive FROM artists WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    # if results[alive].to_str == "true"
    #    yes = "is"
    # else yes = "was"
    # end
    # return yes
    return "was" unless results.first.values == ["true"]
    return "is"
  end

  def exhibitions()
    sql = "SELECT DISTINCT exhibitions.*
    FROM exhibitions
    INNER JOIN artworks ON artworks.exhibition_id = exhibitions.id
    WHERE artworks.artist_id = $1 "
    values = [@id]
    artists_data = SqlRunner.run(sql, values)
    exhibitions = artists_data.map{|exhibition| Exhibition.new(exhibition)}
    return exhibitions

  end

  def exhibitions_distinct()
    sql = "SELECT DISTINCT exhibitions.id
    FROM exhibitions
    INNER JOIN artworks ON artworks.exhibition_id = exhibitions.id
    WHERE artworks.artist_id = $1 "
    values = [@id]
    artists_data = SqlRunner.run(sql, values)
    # exhibitions = artists_data.map{|exhibition| Exhibition.new(exhibition)}
    # return exhibitions
      # sql = "SELECT * FROM exhibitions WHERE artist_id = $1"
      # values = [@id]
      # results = SqlRunner.run(sql, values)

  end

def is_living(alive)
  return "false" unless alive == "false"
  return "true"
end


end
