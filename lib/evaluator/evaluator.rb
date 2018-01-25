# TODO(Drew): Equivalence! Specifically doesn't match for implies situations that are simplified

class Evaluator
	Proof_Line = Struct.new(:sentence, :reference_lines, :type) do end

	def self.Forward_Check_Basic(proof, proof_line, source_line_count)
		if proof_line[:reference_lines].count == source_line_count
			source_line_nums = []
			source_lines = []
			(0..source_line_count-1).each do |idx|
				source_line_nums << proof_line[:reference_lines][idx] - 1
				source_lines << proof[source_line_nums[idx]][:sentence]
			end

			source_lines = source_lines.sort_by(&:length)

			return true, source_lines
		else
			# puts "INVALID NUMBER OF REFERENCES"
			return false, ""
		end
	end

	# NOTE(Drew): source_lines_target_length needs to be an array in sorted order
	# NOTE(Drew): Performs a forward check to make sure that potential lines have the correct pattern before checking in more detail
	def self.Forward_Check(proof, proof_line, source_line_count, source_lines_target_length, proof_line_length)
		if proof_line[:reference_lines].count == source_line_count
			source_line_nums = []
			source_lines = []
			(0..source_line_count-1).each do |idx|
				source_line_nums << proof_line[:reference_lines][idx] - 1
				source_lines << proof[source_line_nums[idx]][:sentence]
			end

			source_lines = source_lines.sort_by(&:length)

			continue = true
			source_lines.each_with_index do |line,idx|
				continue &&= line.length == source_lines_target_length[idx]
			end

			if continue
				if proof_line[:sentence].length == proof_line_length
					return true, source_lines, proof_line
				elsif proof_line_length == 1
					proof_line[:sentence] = [ proof_line[:sentence] ]
					return true, source_lines, proof_line
				else
					# puts "INVALID RESULT"
					return false, "", proof_line
				end
			else
				# puts "INVALID SOURCE LINES"
				return false, "", proof_line
			end
		else
			# puts "INVALID NUMBER OF REFERENCES"
			return false, "", proof_line
		end
	end

	def self.Check_Equals(a, b)
		if a.class == b.class
			return a == b
		elsif a.class == Array && b.class == Symbol && a.length == 1
			return a[0] == b
		elsif a.class == Symbol && b.class == Array && b.length == 1
			return a == b[0]
		else
			# puts "COULDN'T EVALUATE EQUIVALENCE"
			return false
		end
	end

	def self.Identity(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			assumption_line = source_lines[0]
			proof_line = forward_check[2]

			if Check_Equals(assumption_line[1], :and)
				if Check_Equals(assumption_line[0], :true)
					variable = assumption_line[2]
				elsif Check_Equals(assumption_line[2], :true)
					variable = assumption_line[0]
				else
					# puts "ERROR: NO VALID TRUE FOUND FOR AND IDENTITY"
					return false
				end
			elsif Check_Equals(assumption_line[1], :or)
				if Check_Equals(assumption_line[0], :false)
					variable = assumption_line[2]
				elsif Check_Equals(assumption_line[2], :false)
					variable = assumption_line[0]
				else
					# puts "ERROR: NO VALID FALSE FOUND FOR OR IDENTITY"
					return false
				end
			else
				# puts "ERROR: NO VALID IDENTITY FOUND"
				return false
			end

			# print "#{variable} | #{proof_line[:sentence]}"
			# print proof_line[:sentence][0] == variable
			return Check_Equals(proof_line[:sentence][0], variable)
		else
			return false
		end
	end

	def self.Domination(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			assumption_line = source_lines[0]
			proof_line = forward_check[2]

			if Check_Equals(assumption_line[1], :or)
				if Check_Equals(assumption_line[0], :true)
					constant_index = 0
				elsif Check_Equals(assumption_line[2], :true)
					constant_index = 2
				else
					# puts "ERROR: NO VALID TRUE FOUND IN SOURCE LINE"
					return false
				end
			elsif Check_Equals(assumption_line[1], :and)
				if Check_Equals(assumption_line[0], :false)
					constant_index = 0
				elsif Check_Equals(assumption_line[2], :false)
					constant_index = 2
				else
					# puts "ERROR: NO VALID FALSE FOUND IN SOURCE LINE"
					return false
				end
			else
				# puts "ERROR: NO VALID OR/AND FOUND IN SOURCE LINE"
				return false
			end

			return Check_Equals(proof_line[:sentence][0], assumption_line[constant_index])
		else
			return false
		end
	end

	def self.Idempotent(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			assumption_line = source_lines[0]
			proof_line = forward_check[2]

			if Check_Equals(assumption_line[1], :or) || Check_Equals(assumption_line[1], :and)
				if Check_Equals(assumption_line[0], assumption_line[2])
					return Check_Equals(assumption_line[0], proof_line[:sentence][0])
				else
					# puts "ERROR: VARIABLES DON'T MATCH EACH OTHER"
					return false
				end
			else
				# puts "ERROR: DIDN'T FIND AND/OR"
				return false
			end

			return false
		else
			return false
		end
	end

	def self.Double_Negation(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 1 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			negation_line = source_lines[0][0]
			proof_line = forward_check[2]

			if negation_line[0] == :not
				if negation_line[1].length == 2
					if negation_line[1][0] == :not
						variable = negation_line[1][1]
						return Check_Equals(proof_line[:sentence][0], variable)
					else
						# puts "ERROR: NO INNER NOT FOUND"
						return false
					end
				else
					# puts "ERROR: INNER NOT THE RIGHT SIZE"
					return false
				end
			else
				# puts "ERROR: NO NOT FOUND"
				return false
			end
		else
			return false
		end

		return false
	end

	def self.Commutative(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			proof_line = forward_check[2]

			if Check_Equals(single_line[1], :and) || Check_Equals(single_line[1], :or) || Check_Equals(single_line[1], :bicond)
				return Check_Equals(proof_line[:sentence][0], single_line[2]) && Check_Equals(proof_line[:sentence][2], single_line[0])
			elsif Check_Equals(single_line[1], :implies) && Check_Equals(single_line[2][1], :implies)
				return Check_Equals(single_line[0], proof_line[:sentence][2][0]) && Check_Equals(single_line[2][0], proof_line[:sentence][0]) && Check_Equals(single_line[2][2], proof_line[:sentence][2][2])
			else
				# puts "ERROR: NO AND OR OR FOUND"
				return false
			end
		else
			return false
		end
	end

	def self.Associative(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			proof_line = forward_check[2]

			if single_line[0].length == 3 # NOTE(Drew): Source parens left, proof parens right
				source_operators = [ single_line[0][1], single_line[1] ]
				source_elems = [ single_line[0][0], single_line[0][2], single_line[2] ]
				proof_operators = [ proof_line[:sentence][1], proof_line[:sentence][2][1] ]
				proof_elems = [ proof_line[:sentence][0], proof_line[:sentence][2][0], proof_line[:sentence][2][2] ]
			elsif single_line[2].length == 3 # NOTE(Drew): Source parens right, proof parens left
				source_operators = [ single_line[1], single_line[2][1] ]
				source_elems = [ single_line[0], single_line[2][0], single_line[2][2] ]
				proof_operators = [ proof_line[:sentence][0][1], proof_line[:sentence][1] ]
				proof_elems = [ proof_line[:sentence][0][0], proof_line[:sentence][0][2], proof_line[:sentence][2] ]
			else
				return false
			end

			if Check_Equals(source_operators[0], source_operators[1]) && Check_Equals(proof_operators[0], proof_operators[1]) && Check_Equals(source_operators[0], proof_operators[0])
				if Check_Equals(source_elems[0], proof_elems[0]) && Check_Equals(source_elems[1], proof_elems[1]) && Check_Equals(source_elems[2], proof_elems[2])
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end

	def self.Distributive(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			proof_line = forward_check[2]

			short = single_line[0]
			long = single_line[2]

			if (short.length > long.length)
				temp = short
				short = long
				long = temp
			end

			if Check_Equals(single_line[1], :implies)
				operator = :and
			else
				operator = long[1]
			end

			if (Check_Equals(short, proof_line[:sentence][0][0]) || Check_Equals(short, proof_line[:sentence][0][2])) && (Check_Equals(short, proof_line[:sentence][2][0]) || Check_Equals(short, proof_line[:sentence][2][2]))
				if Check_Equals(single_line[1], proof_line[:sentence][0][1]) && Check_Equals(single_line[1], proof_line[:sentence][2][1])
					if Check_Equals(operator, proof_line[:sentence][1])
						return true
					else
						# puts "ERROR: SIGNS DON'T MATCH"
						return false
					end
				else
					# puts "ERROR: SIGNS DON'T MATCH"
					return false
				end
			else
				# puts "ERROR: VARIABLE SETS DON'T MATCH"
				return false
			end
		else
			return false
		end
	end

	def self.Demorgan(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 1 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0][0]
			proof_line = forward_check[2]

			if single_line[0] == :not
				if single_line[1][1] == :or
					operator = :and
				elsif single_line[1][1] == :and
					operator = :or
				else
					# puts "ERROR: DIDN'T FIND GOOD SIGN."
					return false
				end

				if Check_Equals(single_line[1][0], proof_line[:sentence][0][1]) && Check_Equals(single_line[1][2], proof_line[:sentence][2][1])
					if Check_Equals(proof_line[:sentence][0][0], :not) && Check_Equals(proof_line[:sentence][2][0], :not)
						if Check_Equals(proof_line[:sentence][1], operator)
							return true
						else
							# puts "ERROR: WRONG SIGN."
							return false
						end
					else
						# puts "ERROR: DIDN'T FIND CORRECT NOTS"
						return false
					end
				else
					# puts "ERROR: DIDN'T FIND MATCHING VARIABLES"
					return false
				end
			else
				# puts "ERROR: DIDN'T FIND LEADING NOT"
				return false
			end
		else
			return false
		end
	end

	def self.Absorption(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			proof_line = forward_check[2]

			if Check_Equals(single_line[0], single_line[2][0]) && Check_Equals(single_line[0], proof_line[:sentence][0])
				if (Check_Equals(single_line[1], :or) && Check_Equals(single_line[2][1], :and)) || (Check_Equals(single_line[1], :and) && Check_Equals(single_line[2][1], :or))
					return true
				else
					# puts "ERROR: DID NOT FIND CORRECT SIGNS"
					return false
				end
			else
				# puts "ERROR: OUTPUT DOESN'T MATCH"
				return false
			end
		else
			return false
		end
	end

	def self.Negation(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			proof_line = forward_check[2]

			short = single_line[0]
			long = single_line[2]

			if (short.length > long.length)
				temp = short
				short = long
				long = temp
			end

			if Check_Equals(short, long[1])
				if Check_Equals(long[0], :not)
					if Check_Equals(single_line[1], :and) && Check_Equals(proof_line[:sentence][0], :false)
						return true
					elsif Check_Equals(single_line[1], :or) && Check_Equals(proof_line[:sentence][0], :true)
						return true
					else
						# puts "ERROR: DIDN'T FIND APPROPRIATE RESULT"
						return false
					end
				else
					# puts "ERROR: DIDN'T FIND APPROPRIATE NOT"
					return false
				end
			else
				# puts "ERROR: VARIABLE NAMES DON'T MATCH"
				return false
			end
		else
			return false
		end
	end

	def self.Modus_Ponens(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			implies_line = source_lines[1]
			proof_line = forward_check[2]

			if Check_Equals(implies_line[1], :implies)
				if Check_Equals(implies_line[0], single_line[0])
					variable = implies_line[2]
					return Check_Equals(proof_line[:sentence], variable)
				else
					# puts "ERROR: IF P->Q, P IS INVALID"
					return false
				end
			else
				# puts "ERROR: NO IMPLIES FOUND"
				return false
			end
		else
			return false
		end
	end

	def self.Modus_Tollens(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0][0]
			implies_line = source_lines[1]
			proof_line = forward_check[2]

			if Check_Equals(single_line[0], :not)
				if Check_Equals(single_line[1], implies_line[2])
					if Check_Equals(implies_line[1], :implies)
						if Check_Equals(implies_line[0], proof_line[:sentence][0][1])
							if Check_Equals(proof_line[:sentence][0][0], :not)
								return true
							else
								# puts "ERROR: RESULT DOES NOT INLCUDE NOT"
								return false
							end
						else
							# puts "ERROR: RESULT VARIABLE DON'T MATCH SOURCE LINES"
							return false
						end
					else
						# puts "ERROR: NO IMPLIES FOUND"
						return false
					end
				else
					# puts "ERROR: VARIABLES DO NOT MATCH"
					return false
				end
			else
				# puts "ERROR: NOT VARIABLE INCORRECT"
				return false
			end
		else
			return false
		end
	end

	def self.Hypothetical_Syllogism(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 3, 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			proof_line = forward_check[2]

			if Check_Equals(source_lines[0][1], :implies) && Check_Equals(source_lines[1][1], :implies) && Check_Equals(proof_line[:sentence][1], :implies)
				if Check_Equals(source_lines[0][2], source_lines[1][0])
					first_variable = source_lines[0][0]
					second_variable = source_lines[1][2]
				elsif Check_Equals(source_lines[1][2], source_lines[0][0])
					first_variable = source_lines[1][0]
					second_variable = source_lines[0][2]
				else
					# puts "ERROR: CAN'T FIND MATCHING VARIABLES"
					return false
				end

				if Check_Equals(first_variable, proof_line[:sentence][0]) && Check_Equals(second_variable, proof_line[:sentence][2])
					return true
				else
					# puts "ERROR: VARIABLES IN RESULTS DON'T MATCH INPUT LINES"
					return false
				end
			else
				# puts "ERROR: ONE OR MORE OF LINES ARE NOT IMPLIES"
				return false
			end
		else
			return false
		end
	end

	def self.Disjunctive_Syllogism(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			or_line = source_lines[1]
			proof_line = forward_check[2]

			if Check_Equals(or_line[1], :or)
				if Check_Equals(single_line[0][0], :not)
					if Check_Equals(or_line[0], single_line[0][1])
						if Check_Equals(or_line[2], proof_line[:sentence][0])
							return true
						else
							# puts "ERROR: VARIABLES DIDN'T MATCH BETWEEN RESULT AND SOURCE LINES"
							return false
						end
					else
						# puts "ERROR: VARIABLES IN SOURCE LINES DON'T MATCH"
						return false
					end
				elsif Check_Equals(or_line[0][0], :not) && Check_Equals(or_line[2][0], :not)
					if Check_Equals(or_line[0][1], single_line[0])
						if Check_Equals(proof_line[:sentence][0][0], :not)
							if Check_Equals(or_line[2][1], proof_line[:sentence][0][1])
								return true
							else
								# puts "ERROR: VARIABLES DIDN'T MATCH BETWEEN RESULT AND SOURCE LINES"
								return false
							end
						else
							# puts "ERROR: PROOF LINE REQUIRES NOT"
							return false
						end
					else
						# puts "ERROR: VARIABLES IN SOURCE LINES DON'T MATCH"
						return false
					end
				else
					# puts "ERROR: LINE DOES NOT CONTAIN A NOTTED VARIABLE"
					return false
				end
			else
				# puts "ERROR: LINE DOES NOT CONTAIN AN OR"
				return false
			end
		end

		return false
	end

	def self.Addition(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 1 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			if Check_Equals(proof_line[:sentence][1], :or)
				if Check_Equals(proof_line[:sentence][0], single_line[0]) || Check_Equals(proof_line[:sentence][2], single_line[0])
					return true
				else
					# puts "ERROR: DIDN'T MATCH SOURCE FOR ADDITION"
					return false
				end
			else
				# puts "ERROR: RESULT DIDN'T INCLUDE OR"
				return false
			end
		else
			return false
		end

		return false
	end

	def self.Simplification(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			and_line = source_lines[0]
			proof_line = forward_check[2]

			if Check_Equals(and_line[1], :and)
				if Check_Equals(proof_line[:sentence][0], and_line[0]) || Check_Equals(proof_line[:sentence][0], and_line[2])
					return true
				else
					# puts "ERROR: SIMPLIFICATION WAS NOT IN SOURCE STATEMENT"
					return false
				end
			else
				# puts "ERROR: COULDN'T FIND AND IN SOURCE LINE"
				return false
			end
		else
			return false
		end
	end

	def self.Conjunction(proof, proof_line)
		forward_check = Forward_Check_Basic(proof, proof_line, 2)
		if forward_check[0]
			source_lines = forward_check[1]
			first_line = source_lines[0]
			second_line = source_lines[1]
		# first_line = proof[proof_line[:reference_lines][0] - 1][:sentence]
		# second_line = proof[proof_line[:reference_lines][1] - 1][:sentence]

			first_line_length = first_line.length
			second_line_length = second_line.length

			if Check_Equals(proof_line[:sentence][first_line_length], :and) || Check_Equals(proof_line[:sentence][second_line_length],:and)
				if Check_Equals(proof_line[:sentence], first_line + [ :and ] + second_line)
					return true
				elsif Check_Equals(proof_line[:sentence], second_line + [ :and ] + first_line)
					return true
				else
					# puts "ERROR: SOURCE LINES DID NOT MATCH PROOF LINE"
					return false
				end
			else
				# puts "ERROR: NO AND FOUND IN PROOF LINE"
				return false
			end
		else
			return false
		end
	end

	def self.Resolution(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 3, 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			normal_line = source_lines[0]
			not_line = source_lines[1]
			proof_line = forward_check[2]

			if Check_Equals(normal_line[0][0], :not) || Check_Equals(normal_line[2][0], :not)
				temp = normal_line
				normal_line = not_line
				not_line = temp
			end

			if Check_Equals(normal_line[1], :or) && Check_Equals(not_line[1], :or) && Check_Equals(proof_line[:sentence][1], :or)
				if Check_Equals(normal_line[0], not_line[0][1]) && Check_Equals(not_line[0][0], :not)
					normal_line_variable = normal_line[2]
					not_line_variable = not_line[2]
				elsif Check_Equals(normal_line[0], not_line[2][1]) && Check_Equals(not_line[2][0], :not)
					normal_line_variable = normal_line[2]
					not_line_variable = not_line[0]
				elsif Check_Equals(normal_line[2], not_line[0][1]) && Check_Equals(not_line[0][0], :not)
					normal_line_variable = normal_line[0]
					not_line_variable = not_line[2]
				elsif Check_Equals(normal_line[2], not_line[2][1]) && Check_Equals(not_line[2][0], :not)
					normal_line_variable = normal_line[0]
					not_line_variable = not_line[0]
				else
					# puts "ERROR: COULDN'T FIND MATCHING VARIABLES"
					return false
				end

				if Check_Equals(normal_line_variable, proof_line[:sentence][0]) && Check_Equals(not_line_variable, proof_line[:sentence][2])
					return true
				elsif Check_Equals(not_line_variable, proof_line[:sentence][0]) && Check_Equals(normal_line_variable, proof_line[:sentence][2])
					return true
				else
					# puts "ERROR: SECOND CHARACTER IN PROOF LINE DOESN'T MATCH"
					return false
				end
			else
				# puts "ERROR: NOT ALL SOURCE LINES CONTAIN OR"
				return false
			end
		else
			return false
		end
	end

	def self.Implies_Introduction(proof, proof_line, extra_assumptions)
		forward_check = Forward_Check_Basic(proof, proof_line, 2)
		if forward_check[0]
			source_lines = forward_check[1]
			left_line = source_lines[0]
			right_line = source_lines[1]

			match_index = nil

			extra_assumptions.each_with_index do |assumption, index|
				if Check_Equals(assumption, left_line)
					match_index = index
					break
				elsif Check_Equals(assumption, right_line)
					match_index = index
					temp = left_line
					left_line = right_line
					right_line = temp
					break
				end
			end

			if !match_index.nil?
				if Check_Equals(proof_line[:sentence][1], :implies)
					if Check_Equals(left_line, proof_line[:sentence][0])
						if Check_Equals(right_line, proof_line[:sentence][2])
							extra_assumptions.delete_at(match_index)
							return true, extra_assumptions
						else
							return false, extra_assumptions
						end
					else
						return false, extra_assumptions
					end
				else
					return false, extra_assumptions
				end
			else
				return false, extra_assumptions
			end
		else
			return false
		end
	end

	def self.Reducto_Ad_Absurdum(proof, proof_line, conclusion, extra_assumptions)
		forward_check = Forward_Check_Basic(proof, proof_line, 2)
		if forward_check[0]
			source_lines = forward_check[1]
			false_line = source_lines[0]
			negated_line = source_lines[1]

			if Check_Equals(negated_line, :false)
				temp = false_line
				false_line = negated_line
				negated_line = temp
			end

			assumption_index = extra_assumptions.index(negated_line)
			if !assumption_index.nil?
				if Check_Equals(false_line, :false)
					if Check_Equals(negated_line[0][0], :not)
						if Check_Equals(negated_line[0][1], conclusion)
							extra_assumptions.delete_at(assumption_index)
							return true, extra_assumptions
						end
					else
						if Check_Equals(conclusion[0][0], :not)
							if Check_Equals(negated_line[0], conclusion[0][1])
								extra_assumptions.delete_at(assumption_index)
								return true, extra_assumptions
							end
						end
					end

					return false, extra_assumptions
				else
					return false, extra_assumptions
				end
			else
				return false, extra_assumptions
			end
		end
	end

	def self.Evaluate(premesis, conclusion, proof)
		continue = true
		extra_assumptions = []

		proof.each_with_index do |line, index|
			# print "New proof line: #{line[:sentence]}\n"

			case line[:type]
			when :assumption
				if !premesis.include?(line[:sentence])
					extra_assumptions << line[:sentence]
				end
				continue = true
			when :identity
				continue = Identity(proof, line)
			when :domination
				continue = Domination(proof, line)
			when :idempotent
				continue = Idempotent(proof, line)
			when :double_negation
				continue = Double_Negation(proof, line)
			when :commutative
				continue = Commutative(proof, line)
			when :associative
				continue = Associative(proof, line)
			when :distributive
				continue = Distributive(proof, line)
			when :demorgan
				continue = Demorgan(proof, line)
			when :absorption
				continue = Absorption(proof, line)
			when :negation
				continue = Negation(proof, line)
			when :modus_ponens
				continue = Modus_Ponens(proof, line)
			when :modus_tollens
				continue = Modus_Tollens(proof, line)
			when :hypothetical_syllogism
				continue = Hypothetical_Syllogism(proof, line)
			when :disjunctive_syllogism
				continue = Disjunctive_Syllogism(proof, line)
			when :addition
				continue = Addition(proof, line)
			when :simplification
				continue = Simplification(proof, line)
			when :conjunction
				continue = Conjunction(proof, line)
			when :resolution
				continue = Resolution(proof, line)
			when :implies_introduction
				continue = Implies_Introduction(proof, line, extra_assumptions)
			when :reducto_ad_absurdum
				result = Reducto_Ad_Absurdum(proof, line, conclusion, extra_assumptions)
				continue = result[0]
				extra_assumptions = result[1]
			else
				# puts "ERROR: UNKNOWN EXPLAINATION. BREAKING."
				continue = false
			end

			if !continue then break end
		end

		if extra_assumptions.length > 0
			# puts "Extra assumptions used in proof"
			return false
		end

		if continue
			# puts "Proof is correct!"
			return true
		else
			# puts "Error in proof."
			return false
		end
	end
end