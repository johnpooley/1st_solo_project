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
    sql = "RETURN exhibitions.* FROM exhibitions"
    exhibitions = SqlRunner.run(sql)
    results = exhibitions.map{|exhibition| Exhibition.new(exhibition)}
    return results
  end

  # update

  def update()
    sql = "UPDATE exhibitions SET(name, info, active)
    VALUES ($1,$2,$3) WHERE id = $4"
    values = [@name, @info, @active, @id]
    SqlRunner.run(sql)
  end

  # delete

  def self.delete_all()
    sql = "DELETE FROM exhibitions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM exhibitions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

############################################################

end
