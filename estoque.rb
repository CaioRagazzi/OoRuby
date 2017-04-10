require_relative 'contador'

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