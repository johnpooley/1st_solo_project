class Artist

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @alive = options[]
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
    sql = "RETURN artists.* FROM artists"
    artists = SqlRunner.run(sql)
    results = artists.map{|artist| Artist.new(artist)}
    return results
  end

  # update

  def update()
    sql = "UPDATE films SET(name, date_of_birth, alive)
    VALUES ($1,$2,$3) WHERE ID = $4"
    values = [@@name, @date_of_birth, @alive, @id]
    SqlRunner.run(sql, values)
  end

  # delete

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def delete()
    sql "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ########################################################


end
