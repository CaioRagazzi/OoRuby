	class Float
		def para_dinheiro
			valor = "R$" << self.to_s.tr('.', ',')
      		valor << "0" unless valor.match /(.*)(\d{2})$/
      		valor
		end
	end

	module Conversor
		def length
			self.uniq.size
		end
	end

	class Livros_Computacao
		attr_reader :livro

		def initialize
			@livro = []
			@livro.extend Conversor
		end

		def length
			@livro.length
		end
	end

	precos = []
	precos << 10.3 << 20.0 << 30.0 << 40.0
	string = []
	precos.each do |preco|
		puts preco.class
		puts "#{preco.para_dinheiro}"
	end

	livros_comp = Livros_Computacao.new

	livros_comp.livro << "Agile Web Development with Rails"
	livros_comp.livro << "Agile Web Development with Rails 2"
	livros_comp.livro << "Agile Web Development with Rails 2"
	livros_comp.livro << "Agile Web Development with Rails 4"

	puts livros_comp.length



