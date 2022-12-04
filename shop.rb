
class Goods
	def initialize
		@mach = nil
		@quantity = nil
	end
end 

class Books_and_Films < Goods
	def what(b)
		puts 'Що бажаєте переглянути з товару? '
		choice = gets.chomp.downcase.to_s
	 
		if b.has_key?(choice)
			a = b[choice]
			@mach = a[:cena]
			@quatity = a[:quati]
			puts "Ціна цього товару: #{@mach} грн. "  
			puts "Кількість на складі: #{@quatity} шт." 

		elsif choice == "все"
			puts book.keys
		else
			puts 'Запит не виконано'
		end 
	end
	
end	
book = {
		"абетка" => {:cena => 2,
			:quati => 12},
		"словник" => {:cena => 2222,
			:quati => 1111}
}
film = {
		"гаррі потер" => {:cena => 15,
			:quati => 28},
		"форсаж" => {:cena => 34,
			:quati => 1}
}
to_bay = Books_and_Films.new
puts "Раді вас вітати в нашому магазині))
Бажаєте переглянути книги чи фільми?"
choice = gets.chomp.downcase.to_s

if choice == "книги"
	puts "В нас є такі книги: #{book.keys}"
	to_bay.what(book)
elsif choice == "ф?льми"
	puts "В нас є такі фільми: #{film.keys}"
	to_bay.what(film)
elsif choice == "все"
	puts "В нас є такі книги: #{book.keys}"
	puts "В нас є такі фільми: #{film.keys}"
	book_and_film = book.merge(film)
	to_bay.what(book_and_film)
else
	puts "Я не зрозумів"
end 
