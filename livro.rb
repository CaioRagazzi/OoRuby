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