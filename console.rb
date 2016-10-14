require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Alex', 'funds' => 25.00})
customer1.save()
customer2 = Customer.new({'name' => 'Kate', 'funds' => 20.00})
customer2.save()
customer3 = Customer.new({'name' => 'Kyle', 'funds' => 18.50})
customer3.save()
customer4 = Customer.new({'name' => 'David', 'funds' => 35.00})
customer4.save()
customer5 = Customer.new({'name' => 'Claudia', 'funds' => 50.00})
customer5.save()
customer6 = Customer.new({'name' => 'Euan', 'funds' => 21.25})
customer6.save()
customer7 = Customer.new({'name' => 'Bobby', 'funds' => 60.00})
customer7.save()

film1 = Film.new({'title' => 'Lord of the Rings', 'price' => 11.99})
film1.save()
film2 = Film.new({'title' => 'Star Wars', 'price' => 11.99})
film2.save()
film3 = Film.new({'title' => 'Avengers', 'price' => 11.99})
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film2.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film2.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer6.id, 'film_id' => film3.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer7.id, 'film_id' => film3.id})
ticket7.save()

binding.pry
nil