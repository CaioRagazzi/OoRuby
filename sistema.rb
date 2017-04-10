require_relative 'livro'
require_relative 'estoque'

	def imprime_nota_fiscal(livros)
		livros.each do |livro|
			puts "Titulo: #{livro.titulo} - #{livro.preco} - #{livro.possui_reimpressao?}"
		end
	end

	def livro_para_newsletter(livro)
		if livro.ano_lancamento < 1999
			puts "Newletter/Liquidacao"
			puts livro.titulo
			puts livro.preco
		end
	end

	livro_rails = Livro.new("Agile Web Development with Rails",70,2011, true)
	livro_ruby = Livro.new("Programming Ruby 1.9",60,2010, true)	
	agile = Livro.new("Agile Web Development with Rails",70.00, 2011, true)
	algoritmos = Livro.new("Algoritmos", 100, 1998, true)
	arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70.00, 2011, true)

	estoque = Estoque.new
	
	estoque << livro_rails
	puts estoque.maximo_necessario
	estoque << livro_ruby
	puts estoque.maximo_necessario
	estoque << agile
	puts estoque.maximo_necessario
	estoque << algoritmos
	puts estoque.maximo_necessario
	estoque << arquitetura
	puts estoque.maximo_necessario

	estoque.delete arquitetura
	puts estoque.maximo_necessario

	puts estoque.total

	baratos = estoque.mais_baratos_que 80
	
	baratos.each do |livro|
		puts livro.titulo
	end

	estoque.exporta_csv
	todos_livros = estoque.todos_registros

	todos_livros.each do |livro|
		puts livro.titulo
		puts livro.preco
	end	