require_relative "contador"

class Estoque
	attr_reader :livros

	def initialize
		@livros = []
		@vendas = []
		@livros.extend Contador
	end

	def quantidade_de_vendas_de_titulo(produto, &campo)
		@vendas.count {|venda| campo.call(venda) == campo.call(produto)}
	end

	def livro_que_mais_vendeu_por_titulo
		@vendas.sort {|v1,v2|
			quantidade_de_vendas_de_titulo(v1, &titulo) <=>
			quantidade_de_vendas_de_titulo(v2, &titulo)}.last
	end

	def livro_que_mais_vendeu_por_ano
		@vendas.sort {|v1,v2|
			quantidade_de_vendas_de_ano(v1, &ano_lancamento) <=>
			quantidade_de_vendas_de_ano(v2, &ano_lancamento)}.last
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

	def venda(livro)
		@livros.delete livro
		@vendas << livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end
end