# TODO(Drew): Equivalence! Specifically doesn't match for implies situations that are simplified

class Evaluator
	Proof_Line = Struct.new(:sentence, :reference_lines, :type) do end

	def Forward_Check_Basic(proof, proof_line, source_line_count)
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
			return Identity_3(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 4 ], 2)
		if forward_check[0]
			return Identity_4(proof, forward_check[2], forward_check)
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
			return Domination_3(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 4 ], 1)
		if forward_check[0]
			return Domination_4(proof, forward_check[2], forward_check)
		end

		# puts "ERROR: COULDN'T MATCH SOURCE LINES TO DOMINATION PATTERN"
		return false
	end

	def Domination_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		assumption_line = source_lines[0]

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
	end

	def Domination_4(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		assumption_line = source_lines[0]

		if assumption_line[0] == :not
			operator_index = 2
			constant_index = 3
		elsif assumption_line[2] == :not
			operator_index = 1
			constant_index = 0
		else
			# puts "ERROR: COULDN'T FIND NOT"
			return false
		end

		if !(Check_Equals(assumption_line[operator_index], :or) || Check_Equals(assumption_line[operator_index], :and))
			# puts "ERROR: NO VALID OR/AND FOUND IN SOURCE LINE"
			return false
		end

		return Check_Equals(proof_line[:sentence], assumption_line[constant_index])
	end

	def Idempotent(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 1)
		if forward_check[0]
			return Idempotent_3(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 5 ], 2)
		if forward_check[0]
			return Idempotent_5(proof, forward_check[2], forward_check)
		end

		# puts "ERROR: COULDN'T MATCH SOURCE LINES TO IDEMPOTENT PATTERN"
		return false
	end

	def Idempotent_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		assumption_line = source_lines[0]

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
	end

	def Idempotent_5(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		assumption_line = source_lines[0]

		if Check_Equals(assumption_line[2], :or) || Check_Equals(assumption_line[2], :and)
			if Check_Equals(assumption_line[0, 2], assumption_line[3, 2])
				return Check_Equals(assumption_line[0, 2], proof_line[:sentence])
			else
				# puts "ERROR: VARIABLES DON'T MATCH EACH OTHER"
				return false
			end
		else
			# puts "ERROR: DIDN'T FIND AND/OR"
			return false
		end

		return false
	end

	def Double_Negation(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 2 ], 1)
		if forward_check[0]
			source_lines = forward_check[1]
			negation_line = source_lines[0]
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

	def Commutative(proof, proof_line)
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			return Commutative_3(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 5 ], 5)
		if forward_check[0]
			return Commutative_5(proof, forward_check[2], forward_check)
		end

		# puts "ERROR: COULDN'T MATCH SOURCE LINES TO COMMUTATIVE PATTERN"
		return false
	end

	def Commutative_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		single_line = source_lines[0]

		if single_line[1] == :and || single_line[1] == :or
			return Check_Equals(proof_line[:sentence][0], single_line[2]) && Check_Equals(proof_line[:sentence][2], single_line[0])
		else
			# puts "ERROR: NO AND OR OR FOUND"
			return false
		end
	end

	def Commutative_5(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		single_line = source_lines[0]

		if single_line[2] == :and || single_line[2] == :or
			return Check_Equals(proof_line[:sentence][0, 2], single_line[3, 2]) && Check_Equals(proof_line[:sentence][3, 2], single_line[0, 2])
		else
			# puts "ERROR: NO AND OR OR FOUND"
			return false
		end
	end

	def Associative(proof, proof_line)
=begin
		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		if forward_check[0]
			return Associative_3_3(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 4)
		if forward_check[0]
			return Associative_3_4(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 4 ], 3)
		if forward_check[0]
			return Associative_4_3(proof, forward_check[2], forward_check)
		end

		forward_check = Forward_Check(proof, proof_line, 1, [ 4 ], 4)
		if forward_check[0]
			return Associative_4_4(proof, forward_check[2], forward_check)
		end

		# puts "ERROR: COULDN'T MATCH SOURCE LINES TO ASSOCIATIVE PATTERN"
=end
		return false
	end
=begin
	def Associative_3_3(proof, proof_line, forward_check)
		source_lines = forward_check[1]
		single_line = source_lines[0]

		if single_line[0].length == 3 # NOTE(Drew): Source: (norm, norm) norm; Proof: norm, (norm, norm)
			source_operators = [ single_line[0][1], single_line[1] ]
			source_elems = [ single_line[0][0], single_line[0][2], single_line[2] ]
			proof_operators = [ proof_line[:sentence][1], proof_line[:sentence][2][1] ]
			proof_elems = [ proof_line[:sentence][0], proof_line[:sentence][2][0], proof_line[:sentence][2][2] ]
		elsif single_line[0].length == 4 # NOTE(Drew): Source: (norm, not) norm; Proof: norm, (not, norm)
			source_operators = [ single_line[0][1], single_line[1] ]
			source_elems = [ single_line[0][0], single_line[0][2, 2], single_line[2] ]
			proof_operators = [ proof_line[:sentence][1], proof_line[:sentence][2][2] ]
			proof_elems = [ proof_line[:sentence][0], proof_line[:sentence][2][0, 2], proof_line[:sentence][2][3] ]
		elsif single_line[2].length == 3 # NOTE(Drew): Source: norm, (norm, norm); Proof: (norm, norm), norm
			source_operators = [ single_line[1], single_line[2][1] ]
			source_elems = [ single_line[0], single_line[2][0], single_line[2][2] ]
			proof_operators = [ proof_line[:sentence][0][1], proof_line[:sentence][1] ]
			proof_elems = [ proof_line[:sentence][0][0], proof_line[:sentence][0][2], proof_line[:sentence][2] ]
		elsif single_line[2].length == 4 # NOTE(Drew): Source: norm, (not, norm); Proof: (norm, not), norm
			source_operators = [ single_line[1], single_line[2][2] ]
			source_elems = [ single_line[0], single_line[2][0, 2], single_line[2][3] ]
			proof_operators = [ proof_line[:sentence][0][1], proof_line[:sentence][1] ]
			proof_elems = [ proof_line[:sentence][0][0], proof_line[:sentence][0][2, 2], proof_line[:sentence][2] ]
		else
			return false
		end

		return Associative_Exec(source_operators, source_elems, proof_operators, proof_elems)
	end

	def Associative_3_4(proof, proof_line, forward_check) # NOTE(Drew): 'not' in uncovered element
		source_lines = forward_check[1]
		single_line = source_lines[0]

		if single_line[0].length == 4 # NOTE(Drew): Source: (not, norm), norm; Proof: not, (norm, norm)
			source_operators = [ single_line[0][2], single_line[1] ]
			source_elems = [ single_line[0][0, 2], single_line[0][3], single_line[2] ]
			proof_operators = [ proof_line[:sentence][2], proof_line[:sentence][3][1] ]
			proof_elems = [ proof_line[:sentence][0, 2], proof_line[:sentence][3][0], proof_line[:sentence][3][2] ]
		elsif single_line[0].length == 5 # NOTE(Drew): Source: (not, not), norm; Proof: not, (not, norm)
			source_operators = [ single_line[0][2], single_line[1] ]
			source_elems = [ single_line[0][0, 2], single_line[0][3, 2], single_line[2] ]
			proof_operators = [ proof_line[:sentence][2], proof_line[:sentence][3][2] ]
			proof_elems = [ proof_line[:sentence][0, 2], proof_line[:sentence][3][0, 2], proof_line[:sentence][3][3] ]
		elsif single_line[2].length == 4 # NOTE(Drew): Source: norm, (norm, not); Proof: (norm, norm), not
			source_operators = [ single_line[1], single_line[2][1] ]
			source_elems = [ single_line[0], single_line[2][0], single_line[2][2] ]
			proof_operators = [ proof_line[:sentence][0][1], proof_line[:sentence][1] ]
			proof_elems = [ proof_line[:sentence][0][0], proof_line[:sentence][0][2], proof_line[:sentence][2] ]
		elsif single_line[2].length == 5 # NOTE(Drew): Source: norm, (not, not); Proof: (norm, not), not
			source_operators = [ single_line[1], single_line[2][2] ]
			source_elems = [ single_line[0], single_line[2][0, 2], single_line[2][3] ]
			proof_operators = [ proof_line[:sentence][0][1], proof_line[:sentence][1] ]
			proof_elems = [ proof_line[:sentence][0][0], proof_line[:sentence][0][2, 2], proof_line[:sentence][2] ]
		else
			return false
		end

		return Associative_Exec(source_operators, source_elems, proof_operators, proof_elems)
	end

	def Associative_4_3(proof, proof_line, forward_check) # NOTE(Drew): 'not' in covered element
	end

	def Associative_4_4(proof, proof_line, forward_check) # NOTE(Drew): Multiple 'not's
	end

	def Associative_Exec(source_operators, source_elems, proof_operators, proof_elems)
		return false
	end
=end

=begin
	def Associative_Depth(array, n = 0)
		return case
		when array.class != Array
			n
		when array == []
			n + 1
		else
			array.collect{|x| Associative_Depth x, n + 1}.max
		end
	end

	def Associative_Flatten(line, max_depth)
		flattened_line = [ ]
		line.each_with_index do |elem, idx|
			if elem.class == Array
				if Check_Equals(line[idx - 1], :not)
					flattened_line << elem
				elsif Associative_Depth(elem) != max_depth 
					flattened_line << elem
				else
					elem.each do |part|
						flattened_line << part
					end
				end
			else
				flattened_line << elem
			end
		end

		return flattened_line
	end

	def Associative(proof, proof_line)
		# forward_check = Forward_Check(proof, proof_line, 1, [ 3 ], 3)
		forward_check = Forward_Check_Basic(proof, proof_line, 1)
		if forward_check[0]
			source_lines = forward_check[1]
			single_line = source_lines[0]

			delimeter = single_line[1]
			max_depth = Associative_Depth(single_line)
			max_depth = max_depth > 2 ? max_depth - 1 : 0; # NOTE(Drew): Clamp to avoid breaking variables, adjust to account for extra outer array
			print "max_depth: #{max_depth}\n"

			flattened_line = Associative_Flatten(single_line, max_depth)
			count = flattened_line.count { |elem| elem == delimeter }

			if count >= flattened_line.length / 4
				flattened_line = flattened_line.reject { |elem| elem == delimeter }

				# flattened_proof_line = proof_line[:sentence].reject { |elem| elem == delimeter }
				# flattened_proof_line = Associative_Flatten(flattened_proof_line, max_depth)
				

				flattened_proof_line = Associative_Flatten(proof_line[:sentence], max_depth)
				flattened_proof_line = flattened_proof_line.reject { |elem| elem == delimeter }

				print "flattened_line: #{flattened_line}\n"
				print "flattened_proof_line: #{flattened_proof_line}\n"

				idx = 0
				while idx < flattened_line.length
					check_idx = idx

					if Check_Equals(flattened_line, :not)
						check_idx += 1
					end

					match_index = flattened_proof_line.index(flattened_line[check_idx])
					if match_index != nil
						flattened_proof_line.delete_at(match_index)

						if check_idx != idx
							if Check_Equals(flattened_proof_line[idx], :not)
								flattened_proof_line.delete_at(idx)
							else
								return false
							end
						end
					else
						return false
					end

					idx += 1
				end

				return true 
			else
				puts "ERROR: INVALID NUMBER OF DELIMETERS"
				return false
			end
		else
			return false
		end

		return false
	end
=end

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
		if forward_check[0]
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