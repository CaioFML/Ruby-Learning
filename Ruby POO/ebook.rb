require_relative "produto"
require_relative "impresso"

class Ebook < Produto
	def matches?(query)
		["ebook", "digital"].include?(query)
	end
end
