require "rexml/document"

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
	

	def write_in_file(choice)
		to_bay = Books_and_Films.new
		way = to_bay.way(choice)
		file = File.new(way, "a")
		puts 'Напишіть назву.'
		name = read_from_console
		file.puts( name)
		puts 'Напишіть інформацію.'
		infa = read_from_console
		file.puts(infa)
		file.close
		puts 'Товар додано '
		
	end 

	def delete_in_file(choice)
		arr = []
		to_bay = Books_and_Films.new
		hash = to_bay.openning(choice)
		puts "В нас є такі товари: #{hash.keys}"
		puts 'Напишіть назву.'
		name = read_from_console
		if hash.include?(name)
			hash.delete(name)
			arr = Array[*hash]
			puts arr
			way = to_bay.way(choice)
			file = File.new(way, "w")
			file.puts(arr)
			puts 'Товар видалено'
		else
			puts 'Товар не знайдено'
		end 		
		
		
	end 
 


 
	def what(choice, doc)
		goods = Hash.new#створює асофційний масив 
		
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
	
	

current_path = File.dirname(__FILE__)
file_name = current_path + "/goods.xml"
abort "Файл не знайдено" unless File.exist?(file_name)

file = File.new(file_name)
doc = REXML::Document.new(file)#створює копію xml

file.close
puts "Раді вас вітати в нашому магазині))
Бажаєте переглянути книги, фільми чи пісні?"
a =read_from_console



if a == "книги"
	choice = "books/book"
	goods = what(choice, doc)
	to_buy(goods)
elsif a == "фільми"
	choice = "films/film"
	goods = what(choice, doc)
	to_buy(goods)
elsif a == "пісні"
	choice = "musics/music"
	goods = what(choice, doc)
	to_buy(goods)
elsif a == "все"

	choice = "books/book"
	puts "Книги:"
	goods = what(choice, doc)
	choice = "films/film"
	puts "Фільми:"
	goods.merge!(what(choice, doc))
	choice = "musics/music"
	puts "Пісні:"
	goods.merge!(what(choice, doc))
	to_buy(goods)
elsif a == "адмін"
	puts 'Бажаєт додати чи видалити?'
	b = work.read_from_console
	if b == 'додати'
	puts 'Що бажаєте дадати книги чи фільми?'
		b = work.read_from_console
		if b == "книги"
			choice = "book"
			hash = work.write_in_file(choice)
		elsif b == "фільми"
			choice = "film"
			hash = work.write_in_file(choice)
		end
	elsif b == 'видалити'
		puts 'Що бажаєте видалити книги чи фільми?'
		b = work.read_from_console
		if b == "книги"
			choice = "book"
			hash = work.delete_in_file(choice)
		elsif b == "фільми"
			choice = "film"
			hash = work.delete_in_file(choice)
		end
	end 

else
	puts "Я не зрозумів"
end 
