class Work
		def read_from_console
		line = gets.chomp.downcase.to_s
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
		puts 'Товар додано'
		
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
end 


class Books_and_Films 
	def what(b)
		work = Work.new
		puts 'Що бажаєте переглянути з товару? '
		choice = work.read_from_console
	 
		if b.has_key?(choice)
			a = b[choice]
			puts a.to_s
		elsif choice == "все"
			puts b.to_s
		else
			puts 'Запит не виконано'
		end 
	end
	def way(choice)
			current_path = File.dirname(__FILE__)
			file_name = "#{choice}.txt"#створює назву файлу
			return current_path + "/" + file_name#повертає шлях і назву
	end
	def openning(choice)
		arr = []
		file = File.new(way(choice))
		arr += file.read.split("\n") 
		file.close 
		hash = Hash[*arr]
		return hash
	end
end	

to_bay = Books_and_Films.new
work = Work.new
puts "Раді вас вітати в нашому магазині))
Бажаєте переглянути книги чи фільми?"
a = work.read_from_console



if a == "книги"
	choice = "book"
	hash = to_bay.openning(choice)
	
	puts "В нас є такі книги: #{hash.keys}"
	to_bay.what(hash)
elsif a == "фільми"
	choice = "film"
	hash = to_bay.openning(choice)
	puts "В нас є такі фільми: #{hash.keys}"
	to_bay.what(hash)
elsif a == "все"
	choice = "book"
	hash1 = to_bay.openning(choice)
	puts "В нас є такі книги: #{hash1.keys}"
	choice = "film"
	hash2 = to_bay.openning(choice)
	puts "В нас є такі фільми: #{hash2.keys}"
	book_and_film = hash1.merge(hash2)
	to_bay.what(book_and_film)
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
