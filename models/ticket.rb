require_relative("../db/sql_runner")
require_relative("./customer")
require_relative("./film")

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) 
    VALUES (#{@customer_id}, #{@film_id})
    RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    return Film.map_item(sql)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
    return Customer.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new(ticket) }
    return result  
  end

  def self.map_item(sql)
    result = Ticket.map_items(sql)
    return result.first
  end

end