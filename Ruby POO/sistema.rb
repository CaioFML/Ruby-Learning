require_relative "livro"
require_relative "estoque"

def livro_para_newsletter(livro)
	if livro.ano_lancamento < 1999
		puts "Newsletter/liquidaçao"
		puts livro.titulo
		puts livro.preco
		puts livro.possui_reimpressao?
	end
end

def mais_baratos_que(estoque, valor)
	estoque.select do |livro|
		livro.preco <= valor
	end
end


algoritmos = Livro.new("Algoritmos", 100, 1998, true, "")
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 80, 2011, true, "")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "")
ruby = Livro.new("Programming Ruby", 100, 2004, true, "")


estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby

estoque.venda ruby
estoque.venda algoritmos
estoque.venda algoritmos

puts estoque.livro_que_mais_vendeu_por_titulo.titulo