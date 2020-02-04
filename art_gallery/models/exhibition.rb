require_relative('../db/sql_runner.rb')


class Exhibition

  attr_accessor :name, :info, :active
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @info = options['info']
    @active = options['active']
  end


  ################################################
  #CRUD

  # create

  def save()
    sql = "INSERT INTO exhibitions (name, info, active)
    VALUES ($1,$2,$3)
    RETURNING id"
    values = [@name, @info, @active]
    exhibition = SqlRunner.run(sql,values).first
    @id = exhibition['id'].to_i
  end

  # read

  def self.all()
    sql = "SELECT exhibitions.* FROM exhibitions"
    exhibitions = SqlRunner.run(sql)
    results = exhibitions.map{|exhibition| Exhibition.new(exhibition)}
    return results
  end

  def self.all_live()
    sql = "SELECT exhibitions.* FROM exhibitions WHERE active = 'true'"
    exhibitions = SqlRunner.run(sql)
    results = exhibitions.map{|exhibition| Exhibition.new(exhibition)}
    return results
  end

  def self.all_done()
    sql = "SELECT exhibitions.* FROM exhibitions WHERE active = 'false'"
    exhibitions = SqlRunner.run(sql)
    results = exhibitions.map{|exhibition| Exhibition.new(exhibition)}
    return results
  end


  def self.find(id)
    sql = "SELECT * FROM exhibitions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Exhibition.new(results.first)
  end


  # update

  def update()
    sql = "UPDATE exhibitions SET(name, info, active) = ($1,$2,$3) WHERE id = $4"
    values = [@name, @info, @active, @id]
    SqlRunner.run(sql, values)
  end

  # delete

  def self.delete_all()
    sql = "DELETE FROM exhibitions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM exhibitions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  ############################################################

  def artworks()
    sql = "SELECT * FROM artworks WHERE exhibition_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    works = results.map{|art| Artwork.new(art)}
    return works
  end

  def artists()
    sql = "SELECT artists.*
    FROM artists
    INNER JOIN artworks ON artworks.artist_id = artists.id
    WHERE artworks.exhibition_id = $1 "
    values = [@id]
    artists_data = SqlRunner.run(sql, values)
    artists = artists_data.map{|artist| Artist.new(artist)}
    return artists

  end

  def is_active(active)
    return "false" unless active == "false"
    return "true"
  end


end
