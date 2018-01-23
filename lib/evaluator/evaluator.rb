# TODO(Drew): Equivalence! Specifically doesn't match for implies situations that are simplified
# TODO(Drew): Try-catch to give generic error in case of array access failures

# NOTE(Drew): source_lines_target_length needs to be an array in sorted order
# NOTE(Drew): Performs a forward check to make sure that potential lines have the correct pattern before checking in more detail
class Evaluator
	Proof_Line = Struct.new(:sentence, :reference_lines, :type) do end

	def Forward_Check(proof, proof_line, source_line_count, source_lines_target_length, proof_line_length)
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
					return true, source_lines
				else
					# puts "INVALID RESULT"
					return false, ""
				end
			else
				# puts "INVALID SOURCE LINES"
				return false, ""
			end
		else
			# puts "INVALID NUMBER OF REFERENCES"
			return false, ""
		end
	end

	def Check_Equals(a, b)
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

	def Identity(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			return Identity_3(proof, proof_line, forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 4 ], 2)
		if forward_check[0]
			return Identity_4(proof, proof_line, forward_check)
		end

		# puts "ERROR: COULDN'T MATCH SOURCE LINES TO IDENTITY PATTERN"
		return false
	end

	def Identity_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		assumption_line = source_lines[0]

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
	end

	def Identity_4(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		assumption_line = source_lines[0]

		if assumption_line[0] == :not
			operator_index = 2
			variable_index = 0
			constant_index = 3
		elsif assumption_line[2] == :not
			operator_index = 1
			variable_index = 2
			constant_index = 0
		else
			# puts "ERROR: COULDN'T FIND NOT"
			return false
		end

		if assumption_line[operator_index] == :and
			if assumption_line[constant_index] == :true
				variable = assumption_line[variable_index, 2]
			else
				# puts "ERROR: NO VALID TRUE FOUND FOR AND IDENTITY"
				return false
			end
		elsif assumption_line[operator_index] == :or
			if assumption_line[constant_index] == :false
				variable = assumption_line[variable_index, 2]
			else
				# puts "ERROR: NO VALID FALSE FOUND FOR OR IDENTITY"
				return false
			end
		else
			# puts "ERROR: NO VALID IDENTITY FOUND"
			return false
		end

		return Check_Equals(proof_line[:sentence], variable)
	end

	def Domination(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			assumption_line = source_lines[0]
			if assumption_line[1] == :or
				if assumption_line[0] == :true
					variable = assumption_line[2]
				elsif assumption_line[2] == :true
					variable = assumption_line[0]
				else
					puts "ERROR: NO VALID TRUE FOUND FOR OR DOMINATION"
					return false
				end
			elsif assumption_line[1] == :and
				if assumption_line[0] == :false
					variable = assumption_line[2]
				elsif assumption_line[2] == :true
					variable = assumption_line[0]
				else
					puts "ERROR: NO VALID FALSE FOUND FOR AND DOMINATION"
					return false
				end
			else
				puts "ERROR: NO VALID DOMINATION FOUND"
				return false
			end

			return Check_Equals(proof_line, variable)
		else
			return false
		end

		return false
	end

	def Idempotent(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			assumption_line = source_lines[0]

			if assumption_set[1] == :or || assumption_set[1] == :and
				if Check_Equals(assumption_set[0], assumption_set[2])
					if implies_line[2].class == Symbol
						proof_line_match = proof_line[:sentence][0]
					else
						proof_line_match = proof_line[:sentence]
					end

					if assumption_set[0] == proof_line_match
						puts "CORRECT LINE"
						return true
					else
						puts "ERROR: IDEMPOTENT VARIABLES DON'T MATCH RESOLUTION"
						return false
					end
				else
					puts "ERROR: IDEMPOTENT VARIABLES DON'T MATCH EACH OTHER"
					return false
				end
			else
				puts "ERROR: NO VALID IDEMPOTENT FOUND"
				return false
			end

			return Check_Equals(proof_line, variable)
		else
			return false
		end

		return false
	end

	def Double_Negation(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 2 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			negation_line = source_lines[0]

			if negation_line[0] == :not
				if negation_line[1].length == 2
					if negation_line[1][0] == :not
						variable = negation_line[1][1]
						return Check_Equals(proof_line, variable)
					else
						puts "ERROR: NO INNER NOT FOUND"
						return false
					end
				else
					puts "ERROR: INNER NOT THE RIGHT SIZE"
					return false
				end
			else
				puts "ERROR: NO NOT FOUND"
				return false
			end
		else
			return false
		end

		return false
	end

	def Commutative(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			if single_line[1] == :and || single_line[1] == :or
				return Check_Equals(proof_line[:sentence][0], single_line[2]) && Check_Equals(proof_line[:sentence][2], single_line[0])
			else
				puts "ERROR: NO AND OR OR FOUND"
				return false
			end
		else
			return false
		end

		return false
	end

	# NOTE(Drew): REALLY test this one. I'm super unsure if it works
	def Associative(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			delimeter = single_line[0]

			flattened_line = single_line.flatten(1)
			symbols_only = flattened_line.reject { |elem| elem.class != Symbol }

			count == flattened_line.count { |elem| elem == delimeter }
			if count == flattened_line.length / 2
				flattened_line = flattened_line.reject { |elem| elem == delimeter }
				flattened_proof_line = proof_line.flatten(1)
				flattened_proof_line = flattened_proof_line.reject { |elem| elem.class != Symbol }
				flattened_proof_line = flattened_proof_line.reject { |elem| elem == delimeter }

				if flattened_line.sort == flattened_proof_line.sort
					return true
				else
					puts "ERROR: ASSOCIATIVE DOESN'T MATCH"
					return false
				end
			else
				puts "ERROR: INVALID NUMBER OF DELIMETERS"
				return false
			end
		else
			return false
		end

		return false
	end

	# NOTE(Drew): REALLY test this one. I'm super unsure if it works
	def Distributive(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			short = single_line[0]
			long = single_line[1]

			if (long.length > short.length) || (long.length == short.length && short[1] != proof_line[:sentence][1])
				temp = short
				short = long
				long = temp
			end

			if (Check_Equals(short, b[0][0]) || Check_Equals(short, b[0][2])) && (Check_Equals(short, b[2][0]) || Check_Equals(short, b[2][2]))
				if Check_Equals(single_line[1], proof_line[0][1]) && Check_Equals(single_line[1], proof_line[:sentence][2][1])
					if Check_Equals(long[1], proof_line[:sentence][1])
						return true
					else
						puts "ERROR: SIGNS DON'T MATCH"
						return false
					end
				else
					puts "ERROR: SIGNS DON'T MATCH"
					return false
				end
			else
				puts "ERROR: VARIABLE SETS DON'T MATCH"
				return false
			end
		else
			return false
		end

		return false
	end

	def Demorgan(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 2 ], 5)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			if single_line[0] == :not
				if single_line[1][1] == :or
					variable = :and
				elsif single_line[1][1] == :and
					variable = :or
				else
					puts "ERROR: DIDN'T FIND GOOD SIGN."
					return false
				end

				if Check_Equals(single_line[1][0], proof_line[:sentence][1]) && Check_Equals(single_line[1][2], proof_line[:sentence][4])
					if Check_Equals(proof_line[:sentence][0], :not) && Check_Equals(proof_line[:sentence][3], :not)
						if Check_Equals(proof_line[:sentence][2], variable)
							return true
						else
							puts "ERROR: WRONG SIGN."
							return false
						end
					else
						puts "ERROR: DIDN'T FIND CORRECT NOTS"
						return false
					end
				else
					puts "ERROR: DIDN'T FIND MATCHING VARIABLES"
					return false
				end
			else
				puts "ERROR: DIDN'T FIND LEADING NOT"
				return false
			end
		else
			return false
		end

		return false
	end

	def Absorption(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			if Check_Equals(single_line[0], single_line[2][0]) && Check_Equals(single_line[0], proof_line[:sentence][0])
				if (Check_Equals(single_line[1], :or) && Check_Equals(single_line[2][1], :and)) || (Check_Equals(single_line[1], :and) && Check_Equals(single_line[2][1], :or))
					return true
				else
					puts "ERROR: DID NOT FIND CORRECT SIGNS"
					return false
				end
			else
				puts "ERROR: OUTPUT DOESN'T MATCH"
				return false
			end
		else
			return false
		end

		return false
	end

	def Negation(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 4 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			if Check_Equals(single_line[0], single_line[3])
				if Check_Equals(single_line[2], :not)
					if Check_Equals(single_line[1], :and) && Check_Equals(proof_line[:sentence][0], :false)
						return true
					elsif Check_Equals(single_line[1], :or) && Check_Equals(proof_line[:sentence][0], :true)
						return true
					else
						puts "ERROR: DIDN'T FIND APPROPRIATE RESULT"
						return false
					end
				else
					puts "ERROR: DIDN'T FIND APPROPRIATE NOT"
					return false
				end
			elsif Check_Equals(single_line[1], single_line[3])
				if Check_Equals(single_line[0], :not)
					if Check_Equals(single_lines[2], :and) && Check_Equals(proof_line[:sentence][0], :false)
						return true
					elsif Check_Equals(single_line[2], :and) && Check_Equals(proof_line[:sentence][0], :true)
						return true
					else
						puts "ERROR: DIDN'T FIND APPROPRIATE RESULT"
						return false
					end
				else
					puts "ERROR: DIDN'T FIND APPROPRIATE NOT"
					return false
				end
			else
				puts "ERROR: VARIABLE NAMES DON'T MATCH"
				return false
			end
		else
			return false
		end

		return false
	end

	def Modus_Ponens(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 3 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			implies_line = source_lines[1]

			if Check_Equals(implies_line[1], :implies)
				if Check_Equals(implies_line[0], single_line[0])
					variable = implies_line[2]
					return Check_Equals(proof_line, variable)
				else
					puts "ERROR: IF P->Q, P IS INVALID"
					return false
				end
			else
				puts "ERROR: NO IMPLIES FOUND"
				return false
			end
		else
			return false
		end

		return false
	end

	def Modus_Tollens(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 2, 3 ], 2)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]
			implies_line = source_lines[1]

			if Check_Equals(single_line[0], :not)
				if Check_Equals(single_line[1], implies_line[2])
					if Check_Equals(implies_line[1], :implies)
						if Check_Equals(implies_line[0], proof_line[:sentence][1])
							if Check_Equals(proof_line[:sentence][0], :not)
								return true
							else
								puts "ERROR: RESULT DOES NOT INLCUDE NOT"
								return false
							end
						else
							puts "ERROR: RESULT VARIABLE DON'T MATCH SOURCE LINES"
							return false
						end
					else
						puts "ERROR: NO IMPLIES FOUND"
						return false
					end
				else
					puts "ERROR: VARIABLES DO NOT MATCH"
					return false
				end
			else
				puts "ERROR: NOT VARIABLE INCORRECT"
				return false
			end
		else
			return false
		end

		return false
	end

	def Hypothetical_Syllogism(proof, proof_line)
		forward_check = Forward_Check(proof_line, 2, [ 3, 3 ], 3)
		if foward_check[0]
			source_lines = forward_check[1]

			if source_lines[0][1] == :implies && source_lines[1][1] == :implies && proof_line[:sentence][1] == :implies
				if source_lines[0][2] == source_lines[1][0]
					first_variable = source_lines[0][0]
					second_variable = source_lines[1][2]
				elsif source_lines[1][2] == source_lines[0][0]
					first_variable = source_lines[1][0]
					second_variable = source_lines[0][2]
				else
					puts "ERROR: CAN'T FIND MATCHING VARIABLES"
					return false
				end

				if first_variable == proof_line[:sentence][0] && second_variable == proof_line[:sentence][2]
					return true
				else
					puts "ERROR: VARIABLES IN RESULTS DON'T MATCH INPUT LINES"
					return false
				end
			else
				puts "ERROR: ONE OR MORE OF LINES ARE NOT IMPLIES"
				return false
			end
		else
			return false
		end

		return false
	end

	def Disjunctive_Syllogism(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 2, 3 ], 1)
		if forward_check[0]
			return Disjunctive_Syllogism_2_3(proof, proof_line, forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 5 ], 2)
		if forward_check[0]
			return Disjunctive_Syllogism_1_5(proof, proof_line, forward_check)
		end

		return false
	end

	def Disjunctive_Syllogism_2_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		negate_line = source_lines[0]
		or_line = source_lines[1]

		if Check_Equals(or_line[1], :or)
			if negate_line[0][0] == :not
				if or_line[0] == negate_line[0][1]
					if or_line[2] == proof_line[:sentence][0]
						return true
					else
						puts "ERROR: VARIABLES DIDN'T MATCH BETWEEN RESULT AND SOURCE LINES"
						return false
					end
				else
					puts "ERROR: VARIABLES IN SOURCE LINES DON'T MATCH"
					return false
				end
			else
				puts "ERROR: LINE DOES NOT CONTAIN A NOTTED VARIABLE"
				return false
			end
		else
			puts "ERROR: LINE DOES NOT CONTAIN AN OR"
			return false
		end

		return false
	end

	def Disjunctive_Syllogism_1_5(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		short_line = source_lines[0]
		long_line = source_lines[1]

		if Check_Equals(long_line[0], :not) && Check_Equals(long_line[3], :not)
			if Check_Equals(short_line[0], long_line[1])
				if Check_Equals(proof_line[:sentence][0], :not)
					if Check_Equals(proof_line[:sentence][1], long_line[4])
						return true
					else
						puts "ERROR: PROOF LINE DOESN'T MATCH RESULING VARIABLE"
						return false
					end
				else
					puts "ERROR: PROOF LINE MUST BE NEGATED"
					return false
				end
			else
				puts "ERROR: VARIABLES DO NOT MATCH BETWEEN SOURCE LINES"
				return false
			end
		else
			puts "ERROR: BOTH VARIABLES MUST BE NEGATED"
			return false
		end

		return false
	end

	def Addition(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 1 ], 3)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			if proof_line[:sentence][1] == :or
				if proof_line[:sentence][0] == single_line[0] || proof_line[:sentence][0] == single_line[1]
					return true
				else
					puts "ERROR: DIDN'T MATCH SOURCE FOR ADDITION"
					return false
				end
			else
				puts "ERROR: RESULT DIDN'T INCLUDE OR"
				return false
			end
		else
			return false
		end

		return false
	end

	def Simplification(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			return Simplification_3(proof, proof_line, forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 5 ], 2)
		if forward_check[0]
			return Simplification_5(proof, proof_line, forward_check)
		end

		return false
	end

	def Simplification_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		and_line = source_lines[0]

		if and_line[1] == :and
			if proof_line[:sentence][0] == and_line[0] || proof_line[:sentence][0] == and_line[2]
				return true
			else
				puts "ERROR: SIMPLIFICATION WAS NOT IN SOURCE STATEMENT"
				return false
			end
		else
			puts "ERROR: COULDN'T FIND AND IN SOURCE LINE"
			return false
		end

		return false
	end

	def Simplification_5(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		and_line = source_lines[0]

		if and_line[2] == :and
			if and_line[0] == :not && and_line[3] == :not
				if proof_line[:sentence][0] == :not
					if proof_line[:sentence][1] == and_line[1] || proof_line[:sentence][1] == and_line[4]
						return true
					else
						puts "ERROR: SIMPLIFICATION WAS NOT IN SOURCE STATEMENT"
						return false
					end
				else
					puts "ERROR: PROOF LINE MUST BE NEGATED"
					return false
				end
			else
				puts "ERROR: BOTH VARIABLES IN SOURCE LINE MUST BE NEGATED"
				return false
			end
		else
			puts "ERROR: COULDN'T FIND AND IN SOURCE LINE"
			return false
		end

		return false
	end

	def Conjunction(proof, proof_line)
		first_line = proof[proof_line[:reference_lines][0] - 1][:sentence]
		second_line = proof[proof_line[:reference_lines][1] - 1][:sentence]

		first_line_length = first_line.length
		second_line_length = second_line.length

		if Check_Equals(proof_line[:sentence][first_line_length], :and) || Check_Equals(proof_line[:sentence][second_line_length],:and)
			if Check_Equals(proof_line[:sentence], first_line + [ :and ] + second_line)
				return true
			elsif Check_Equals(proof_line[:sentence], second_line + [ :and ] + first_line)
				return true
			else
				puts "ERROR: SOURCE LINES DID NOT MATCH PROOF LINE"
				return false
			end
		else
			puts "ERROR: NO AND FOUND IN PROOF LINE"
			return false
		end

		return false
	end

	# TODO(Drew): If any OR/AND line is swapped around, it is still just as valid, but I don't even check for that
	def Resolution(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 3, 4 ], 3)
		if forward_check[0]
			source_lines = forward_check[0]
			normal_line = source_lines[0]
			not_line = source_lines[1]

			if normal_line[1] == :or && not_line[2] == :or && proof_line[:sentence][1] == :or
				if not_line[0][0] == :not
					if normal_line[0] == not_line[0][1]
						if normal_line[2] == proof_line[:sentence][0]
							if not_line[2] == proof_line[:sentence][2]
								return true
							else
								puts "ERROR: SECOND CHARACTER IN PROOF LINE DOESN'T MATCH"
								return false
							end
						else
							puts "ERROR: FIRST CHARACTER IN PROOF LINE DOESN'T MATCH"
							return false
						end
					else
						puts "ERROR: FIRST VARIABLES OF SOURCE LINES DON'T MATCH"
						return false
					end
				else
					puts "ERROR: DIDN'T FIND NOT IN ONE OF THE SOURCE LINES"
					return false
				end
			else
				puts "ERROR: NOT ALL SOURCE LINES CONTAIN OR"
				return false
			end
		else
			return false
		end

		return false
	end

	def Reducto_Ad_Absurdum(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 2 ], 1)
		if forward_check[0]
			return Reducto_Ad_Absurdum_1(proof, proof_line, forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 2, [ 1, 1 ], 2)
		if forward_check[0]
			return Reducto_Ad_Absurdum_1(proof, proof_line, forward_check)
		end

		return false
	end

	def Reducto_Ad_Absurdum_1(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		false_line = source_lines[0]
		negated_line = source_lines[1]

		if Check_Equals(false_line[0], :false)
			if Check_Equals(negated_line[0], :not)
				if Check_Equals(negated_line[1], proof_line[:sentence][0])
					return true
				else
					puts "ERROR: VARIABLE IN PROOF LINE DOESN'T MATCH"
					return false
				end
			else
				puts "ERROR: SOURCE LINE VARIABLE MUST BE NEGATED"
				return false
			end
		else
			puts "ERROR: MUST PROVE FALSE TO USE RAA"
			return false
		end

		return false
	end

	def Reducto_Ad_Absurdum_2(proof, proof_line, forward_check)
		source_lines = forward_check[0]
		false_line = source_lines[0]
		variable_line = source_lines[1]

		if Check_Equals(variable_line[0], :not)
			temp_line = false_line
			false_line = variable_line
			variable_line = temp_line
		end

		if Check_Equals(false_line[0], :false)
			if Check_Equals(proof_line[:sentence][0], :not)
				if Check_Equals(variable_line[0], proof_line[:sentence][1])
					return true
				else
					puts "ERROR: VARIABLE IN PROOF LINE DOESN'T MATCH"
					return false
				end
			else
				puts "ERROR: PROOF LINE VARIABLE MUST BE NEGATED"
				return false
			end
		else
			puts "ERROR: MUST PROVE FALSE TO USE RAA"
			return false
		end

		return false
	end

	def Default_Test()
		# NOTE(Drew): Simplistic testing proof
		# premesis = [ [ :p ], [ :p, :implies, :q ], [ :q, :implies, :r ] ]
		# conclusion = [ :r ]

		# line_1 = Proof_Line.new([ :p ], [ 1 ], :assumption)
		# line_2 = Proof_Line.new([ :p, :implies, :q ], [ 2 ], :assumption)
		# line_3 = Proof_Line.new([ :q, :implies, :r ], [ 3 ], :assumption)
		# line_4 = Proof_Line.new([ :q ], [ 1, 2 ], :modus_ponens)
		# line_5 = Proof_Line.new([ :r ], [ 3, 4 ], :modus_ponens)
		# proof = [ line_1, line_2, line_3, line_4, line_5 ]

		# NOTE(Drew): Logic example proof done by Dr. Ritchey
		premesis = [ [ :p ], [ [ :p, :or, :q ], :implies, :r ], [ :m ], [ [ :m, :and, :r ], :implies, :s ] ]
		conclusion = [ :s ]

		line_01 = Proof_Line.new([ [ :p, :or, :q ], :implies, :r ], [ ], :assumption)
		line_02 = Proof_Line.new([ :m ], [ ], :assumption)
		line_03 = Proof_Line.new([ [ :m, :and, :r ], :implies, :s ], [ ], :assumption)
		line_04 = Proof_Line.new([ :not, [ :s ] ], [ ], :assumption)
		line_05 = Proof_Line.new([ :not, [ :m, :and, :r ] ], [ 3, 4 ], :modus_tollens)
		line_06 = Proof_Line.new([ :not, [ :m ], :or, :not, [ :r ] ], [ 5 ], :demorgan)
		line_07 = Proof_Line.new([ :not, [ :r ] ], [ 2, 6 ], :disjunctive_syllogism)
		line_08 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1, 7 ], :modus_tollens)
		line_09 = Proof_Line.new([ :not, [ :p ], :and, :not, [ :q ] ], [ 8 ], :demorgan)
		line_10 = Proof_Line.new([ :p ], [ ], :assumption)
		line_11 = Proof_Line.new([ :not, [ :p ] ], [ 9 ], :simplification)
		line_12 = Proof_Line.new([ :p, :and, :not, [ :p ] ], [ 10, 11 ], :conjunction)
		line_13 = Proof_Line.new([ :false ], [ 12 ], :negation)
		line_14 = Proof_Line.new([ :s ], [ 4, 13 ], :reducto_ad_absurdum)
		proof = [ line_01, line_02, line_03, line_04, line_05, line_06, line_07, line_08, line_09, line_10, line_11, line_12, line_13, line_14 ]

		Test(premesis, conclusion, proof)

		# NOTE(Drew): Extra implies proof
		# premesis = [ [ :p, :implies, :r ], [ :r, :implies, :q ] ]
		# conclusion = [ :p, :implies, :q ]

		# line_1 = Proof_Line.new([ :p, :implies, :r ], [ 1 ], :assumption)
		# line_2 = Proof_Line.new([ :r, :implies, :q ], [ 2 ], :assumption)
		# line_3 = Proof_Line.new([ :p ], [ 3 ], :assumption)
		# line_4 = Proof_Line.new([ :r ], [ 1, 3 ], :modus_ponens)
		# line_5 = Proof_Line.new([ :q ], [ 2, 4 ], :modus_ponens)
		# line_6 = Proof_Line.new([ :p, :implies, :q ], [ 3, 5 ], :introduction)
		# proof = [ line_1, line_2, line_3, line_4, line_5, line_6 ]
	end

	def Test(premesis, conclusion, proof)
		continue = true
		conclusion_negation = [ :not, [ conclusion[0] ] ]

		proof.each_with_index do |line, index|
			print "New proof line: "
			print line[:sentence]
			puts

			case line[:type]
			when :assumption
				if premesis.include?(line[:sentence])
					next
				elsif line[:sentence] == conclusion_negation
					next
				else
					puts "ERROR: ASSUMPTION NOT IN PREMESIS"
					continue = false
					break
				end
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
			when :reducto_ad_absurdum
				continue = Reducto_Ad_Absurdum(proof, line)
			else
				puts "ERROR: UNKNOWN EXPLAINATION. BREAKING."
				continue = false
			end

			if !continue then break end
		end

		if continue
			puts "Proof is correct!"
		else
			puts "Error in proof."
		end
	end
end