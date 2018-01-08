

# TODO
# - Premesis not well formed
# - Conclusions not well formed
# - Never reach a conclusion
# - 

class PropositionalParser

	Operators = { :and, :or, :implies, :not, :bicond, :xor }
	Rules = { :assumption, :identity, :domination, :idempotent, :double_negation, :commutative, :associative, :distributive, :demorgans, :absorption, :negation }
	proof = {
				{ { :P, :implies, :Q }, { }, :assumption },
				{ { :P }, { }, :assumption },
				{ { :Q }, { 1, 2 }}
			}

	def eval
		# Need array of lines

	end
end

# P -> Q
