class Livro
	attr_reader :titulo, :preco, :ano_lancamento
	def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
		@titulo = titulo
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)
	end

	def possui_reimpressao?
		@possui_reimpressao
	end

	def to_csv
		"#{@titulo}, #{@ano_lancamento}, #{@preco}"
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

module Contador
	def <<(livro)
		push(livro)
		if @maximo_necessario.nil? || @maximo_necessario < size
			@maximo_necessario = size
		end
		self
	end

	attr_reader :maximo_necessario
end


class Estoque
	attr_reader :livros

	def initialize
		@livros = []
		@livros.extend Contador
	end

	def exporta_csv
		@livros.each do |livro|
			puts livro.to_csv
		end
	end

	def mais_baratos_que(valor)
		@livros.select do |livro|
			livro.preco <= valor
		end
	end

	def total
		@livros.size
	end

	def <<(livro)
		@livros << livro if livro
		self
	end

	def remove(livro)
		@livros.delete livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end
end


def mais_baratos_que(estoque, valor)
	estoque.select do |livro|
		livro.preco <= valor
	end
end



estoque = Estoque.new
estoque << Livro.new("Algoritmos", 100, 1998, true)
puts estoque.maximo_necessario
estoque << Livro.new("Introducao a Arquitetura e Design de Software", 80, 2011, true)
puts estoque.maximo_necessario
estoque << Livro.new("The Pragmatic Programmer", 100, 1999, true)
puts estoque.maximo_necessario
estoque << Livro.new("Programming Ruby", 100, 2004, true)
puts estoque.maximo_necessario
estoque.exporta_csv