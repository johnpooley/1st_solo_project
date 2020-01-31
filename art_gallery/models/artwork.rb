require_relative('../db/sql_runner.rb')

class Artwork

  attr_accessor
  attr_reader

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @exhibition = options['exhibition_id'].to_i
    @artist = options['artist_id'].to_i
    @date = options['date']
    @description = options['description']
end


#############################################
# CRUD

# create

def save()
  sql = "INSERT INTO artworks
          (
          title,
          exhibition_id,
          artist_id,
          date,
          description)
          VALUES ($1,$2,$3,$4,$5)
          RETURNING id"
  values = [@title, @exhibition, @artist,
            @date, @description]
  artwork = SqlRunner.run(sql, values).first
  @id = artwork['id'].to_i
end

# read

def self.all()
  sql = "RETURN artworks.* FROM artworks"
  artworks = SqlRunner.run(sql)
  results = artworks.map{|artwork| Artwork.new(artwork)}
  return results
end

# update

def update()
  sql = "UPDATE artworks SET(
  title,
  exhibition_id,
  artist_id,
  date,
  description)
  VALUES ($1,$2,$3,$4,$5,) WHERE id = $6"
  values = [@title, @exhibition, @artist,
            @date, @description, @id]
  SqlRunner.run(sql, values)
end

# delete

def self.delete_all()
  sql = "DELETE FROM artworks"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM artworks WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

########################################################


end
