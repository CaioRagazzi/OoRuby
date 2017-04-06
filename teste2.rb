
	class Dicionario
		attr_reader :nomes

		def initialize
			@nomes = []
			def @nomes.length
				self.uniq.size
			end
		end

		def length
			@nomes.length
		end

	end


	dicionario = Dicionario.new
	dicionario.nomes << "caio"
	#puts teste.a.to_s
	puts dicionario.length