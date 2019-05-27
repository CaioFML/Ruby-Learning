require_relative "livro"
require_relative "revista"
require_relative "ebook"
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


algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", true)
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software", 80, 2011, true, "", false)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "", false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", false)
revistona = Revista.new("Artigo de Ruby", 10, 2012, true, "Revistas", 3)
online_arquitetura = Ebook.new("Introducao a Arquitetura e Design de Software",50, 2012, "")


estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby <<
revistona << revistona << online_arquitetura

estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
estoque.vende online_arquitetura

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
