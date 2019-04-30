class Livro
	attr_accessor :titulo, :preco, :ano_lancamento
	def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
		@titulo = titulo
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)	
	end

	def possui_reimpressao?
		@possui_reimpressao
	end

	private

	def calcula_preco(base)
		if @ano_lancamento < 2006
			if @possui_reimpressao
				base * 0.9
			else
				base *0.95
			end
		elsif @ano_lancamento <= 2010
			base *0.96
		else
			base
		end
	end
end

def livro_para_newsletter(livro)
	if livro.ano_lancamento < 1999
		puts "Newsletter/liquidaçao"
		puts livro.titulo
		puts livro.preco
		puts livro.possui_reimpressao?
	end
end

def exporta_csv(estoque)
	estoque.each do |livro|
		puts "#{livro.titulo}, #{livro.ano_lancamento}"
	end
end

estoque = []
estoque << Livro.new("Algoritmos", 100, 1998, true)
estoque << Livro.new("Introducao a Arquitetura e Design de Software", 80, 2011, true)
estoque << Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque << Livro.new("Programming Ruby", 100, 2004, true)



exporta_csv(estoque)

