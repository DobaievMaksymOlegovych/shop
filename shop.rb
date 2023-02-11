require "rexml/document"
require "./metods_shop.rb"
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
	b = read_from_console
	if b == 'додати'
	puts 'Що бажаєте дадати книги, фільми чи пісні?'
		b = read_from_console
		if b == "книги"
			choice = "books"
			write_in_file(choice, doc)
		elsif b == "фільми"
			choice = "films"
			write_in_file(choice, doc)
		elsif b == "пісні"
			choice = "musics"
			write_in_file(choice, doc)
		end
	elsif b == 'видалити'
		puts 'Що бажаєте видалити книги, фільми чи пісні?'
		b = read_from_console
		if b == "книги"
			choice = "books"
			hash = delete_in_file(choice, doc)
		elsif b == "фільми"
			choice = "films"
			hash = delete_in_file(choice, doc)
		elsif b == "пісні"
			choice = "musics"
			write_in_file(choice, doc)
		end
	end 

else
	puts "Я не зрозумів"
end 
