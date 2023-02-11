def read_from_console
	line = gets.chomp.to_s
	line = line.split(//)#ділить на массив
	w = ""
	for item in line do #перевіряє массив на букву"і"
		if item == "?"
			w << "і"
		else 
			w << item
		end
	end
	return w.to_s#збирає в масив	
end
	

def write_in_file(choice, doc)
	goods = doc.elements.each("goods/#{choice}") do 
	end
	if choice == "books"
		puts 'Введіть назву'
		name = read_from_console
		puts 'Ввeдіть ціну'
		price = gets.chomp
		puts 'Ввeдіть кількість'
		quantity = gets.chomp
		book = goods.first.add_element 'book', {
		'name' => name,
		'price' => price,
		'quantity' => quantity
		}
	elsif  choice == "films"
		puts 'Введіть назву'
		name = read_from_console
		puts 'Ввeдіть ціну'
		price = gets.chomp
		puts 'Ввeдіть кількість'
		quantity = gets.chomp  
		film = goods.first.add_element 'film', {
		'name' => name,
		'price' => price,
		'quantity' => quantity
		}
	elsif  choice == "musics"
		puts 'Введіть назву'
		name = read_from_console
		puts 'Ввeдіть ціну'
		price = gets.chomp
		puts 'Ввeдіть кількість'
		quantity = gets.chomp  
		music = goods.first.add_element 'music', {
		'name' => name,
		'price' => price,
		'quantity' => quantity
		}
	end
		
	file = File.new("goods.xml", "w:UTF-8")
	doc.write(file, 2)
	file.close
	puts "Товар додано"
end 

def delete_in_file(choice, doc)
 #to do		
end 
 
def what(choice, doc)
	goods = Hash.new#створює асоціайний масив 	
	doc.elements.each("goods/#{choice}") do |item|#цикл по всім елементам дерева
		name = item.attributes["name"] 
		price = item.attributes["price"]# 
		quantity = item.attributes["quantity"]
		goods[name] ||=price
		print "Назва: #{name}"
		print " Ціна: #{price}"
		puts " Кількість на складі: #{quantity}"	
	end
	return goods
end

def to_buy(goods)
	puts "Що бажаєте купити?"
	choice = read_from_console
	puts "Сумма покупки становить: #{goods[choice]}грн."
end 