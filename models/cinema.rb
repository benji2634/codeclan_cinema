require_relative("../db/sql_runner")
require_relative("./customer")
require_relative("./film")
require_relative("./ticket")

class Cinema

  attr_reader :id, :cinema_chain, :location, :capacity

  def initialize(options)
    @id = options['id'].to_i
    @cinema_chain = options['cinema_chain']
    @location = options['location']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO cinemas (cinema_chain, location, capacity) 
    VALUES ('#{@cinema_chain}', '#{@location}', #{capacity})
    RETURNING *"
    cinema = SqlRunner.run(sql).first
    @id = cinema['id'].to_i
  end

 def self.all()
   sql = "SELECT * FROM cinemas"
   cinemas = SqlRunner.run(sql)
   result = cinemas.map {|cinema| Cinema.new(cinema)}
   return result
 end

  def self.delete_all()
    sql = "DELETE FROM cinemas"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    cinemas = SqlRunner.run(sql)
    result = cinemas.map { |cinema| Cinema.new(cinema)}
    return result  
  end

  def self.map_item(sql)
    result = Cinema.map_items(sql)
    return result.first
  end

end