
class Goods
	def initialize
		@mach = nil
		@quantity = nil
	end
end 

class Books < Goods
	book = {
		"абетка" => :cena = 2
			:quati = 12,
		"словник" => 
			:cena => 2222,
			:quati => 1111

		
	}
	puts 'Що бажаєте переглянути з покупок? '
	choice = gets.chomp.downcase.to_s
	 
		if book.has_key?(choice)
			puts book[choice]
			puts choice[:cena]
			@mach = cena
			@quatity = quati 

		elsif choice == "все"
			puts book.keys
		else
			puts 'Запит не виконано'
		end 
	
end	

vybor = Books.new
vybor
puts @mach
puts @quantity