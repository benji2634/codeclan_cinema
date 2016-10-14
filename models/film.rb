require_relative("../db/sql_runner")

class Film

  attr_reader :id, :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id}"
    return Customer.map_items(sql)
  end

  def save()
    sql = "INSERT INTO films (title, price) 
    VALUES ('#{@title}', #{@price})
    RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film) }
    return result  
  end

  def self.map_item(sql)
    result = Film.map_items(sql)
    return result.first
  end

end