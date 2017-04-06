class Livro

	attr_reader :titulo, :ano_lancamento, :preco

	def initialize(titulo, preco,ano_lancamento, possui_reimpressao)
	    @titulo = titulo
	    @ano_lancamento = ano_lancamento
	    @preco = calcula_preco(preco)
	    @possui_reimpressao = possui_reimpressao
  	end

  	def possui_reimpressao?
  		@possui_reimpressao
  	end

  	def to_csv
    	"#{@titulo},#{@ano_lancamento},#{@preco}"
    end

  	private

  	def calcula_preco(base)
  		if @ano_lancamento < 2006
  			if @possui_reimpressao == false
  				base *= 0.95
  			else
  				base *= 0.90
  			end
  		elsif @ano_lancamento < 2010
  			base *= 0.96
  		end
  		base
  	end

end

class Conversor
	def string_para_alfanumerico(titulo)
		titulo.gsub /[^\w\s]/,''
	end
end

module Contador
		def << (livro)
		    push (livro)
		    if @maximo_necessario.nil? || @maximo_necessario < size
		      @maximo_necessario = size
		    end
		    self
  		end

  		def maximo_necessario
  			@maximo_necessario
  		end
end

class Estoque

	attr_reader :livros

	def initialize
    @livros = []
    @livros.extend Contador
  	end

	def total
		@livros.size
	end

	def todos_registros
		@livros.each do |livro|
			livro
		end
	end

	def mais_baratos_que(valor)
		@livros.select do |livro|
			livro.preco <= valor
		end
	end

	def exporta_csv
		@livros.each do |livro|
			puts livro.to_csv
		end
	end

	def << (livro)
		@livros << livro if livro
		self
	end

	def maximo_necessario
    @livros.maximo_necessario
  	end

  	def delete(livro)
  		@livros.delete livro
  	end
end


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