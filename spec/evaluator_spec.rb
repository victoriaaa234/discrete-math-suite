# TODO(Drew): Error check if some hooligan uses a 'not' where an 'and', 'or', etc. would go

require "evaluator/evaluator"

describe Evaluator do
	Proof_Line = Struct.new(:sentence, :reference_lines, :type) do end

	describe "All" do
		# NOTE(Drew): Error case tests, single input line
		context "Given an empty source line" do
			line_01 = Proof_Line.new([ ], [ ], nil)
			line_02 = Proof_Line.new([ ], [ ], :nil)
			proof = [ line_01, line_02 ]

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		# NOTE(Drew): Invalid cases that are pattern matches, technically valid
		context "Given a source line of 'False ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns true for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns true for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'False ∨ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns true for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'True ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns false for all others" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns true for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns true for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'True ∧ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns true for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end

		context "Given a proof using modus_ponens" do
			premesis = [ [ :p ], [ :p, :implies, :q ], [ :q, :implies, :r ] ]
			conclusion = [ :r ]

			line_1 = Proof_Line.new([ :p ], [ 1 ], :assumption)
			line_2 = Proof_Line.new([ :p, :implies, :q ], [ 2 ], :assumption)
			line_3 = Proof_Line.new([ :q, :implies, :r ], [ 3 ], :assumption)
			line_4 = Proof_Line.new([ :q ], [ 1, 2 ], :modus_ponens)
			line_5 = Proof_Line.new([ :r ], [ 3, 4 ], :modus_ponens)
			proof = [ line_1, line_2, line_3, line_4, line_5 ]

			it "returns true" do
				expect(Evaluator.Evaluate(premesis, conclusion, proof)).to eql(true)
			end
		end

		context "Given a proof using modus_ponens and implies introduction" do
			premesis = [ [ :p, :implies, :r ], [ :r, :implies, :q ] ]
			conclusion = [ :p, :implies, :q ]

			line_1 = Proof_Line.new([ :p, :implies, :r ], [ 1 ], :assumption)
			line_2 = Proof_Line.new([ :r, :implies, :q ], [ 2 ], :assumption)
			line_3 = Proof_Line.new([ :p ], [ 3 ], :assumption)
			line_4 = Proof_Line.new([ :r ], [ 1, 3 ], :modus_ponens)
			line_5 = Proof_Line.new([ :q ], [ 2, 4 ], :modus_ponens)
			line_6 = Proof_Line.new([ :p, :implies, :q ], [ 3, 5 ], :implies_introduction)
			proof = [ line_1, line_2, line_3, line_4, line_5, line_6 ]

			it "returns true" do
				expect(Evaluator.Evaluate(premesis, conclusion, proof)).to eql(true)
			end
		end

		context "Given the proof given to us by Dr. Ritchey" do
			premesis = [ [ :p ], [ [ :p, :or, :q ], :implies, :r ], [ :m ], [ [ :m, :and, :r ], :implies, :s ] ]
			conclusion = [ :s ]

			line_01 = Proof_Line.new([ [ :p, :or, :q ], :implies, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :m ], [ ], :assumption)
			line_03 = Proof_Line.new([ [ :m, :and, :r ], :implies, :s ], [ ], :assumption)
			line_04 = Proof_Line.new([ [ :not, [ :s ] ] ], [ ], :assumption)
			line_05 = Proof_Line.new([ [ :not, [ :m, :and, :r ] ] ], [ 3, 4 ], :modus_tollens)
			line_06 = Proof_Line.new([ [ :not, [ :m ] ], :or, [ :not, [ :r ] ] ], [ 5 ], :demorgan)
			line_07 = Proof_Line.new([ [ :not, [ :r ] ] ], [ 2, 6 ], :disjunctive_syllogism)
			line_08 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ 1, 7 ], :modus_tollens)
			line_09 = Proof_Line.new([ [ :not, [ :p ] ], :and, [ :not, [ :q ] ] ], [ 8 ], :demorgan)
			line_10 = Proof_Line.new([ :p ], [ ], :assumption)
			line_11 = Proof_Line.new([ [ :not, [ :p ] ] ], [ 9 ], :simplification)
			line_12 = Proof_Line.new([ :p, :and, [ :not, [ :p ] ] ], [ 10, 11 ], :conjunction)
			line_13 = Proof_Line.new([ :false ], [ 12 ], :negation)
			line_14 = Proof_Line.new([ :s ], [ 4, 13 ], :reducto_ad_absurdum)
			proof = [ line_01, line_02, line_03, line_04, line_05, line_06, line_07, line_08, line_09, line_10, line_11, line_12, line_13, line_14 ]

			it "returns true" do
				expect(Evaluator.Evaluate(premesis, conclusion, proof)).to eql(true)
			end
		end
	end







	describe "#Identity" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∧ True' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'P ∨ False' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'True ∧ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :true, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'False ∨ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :false, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∧ True' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∧ True' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∨ False' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∨ False' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'True ∧ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :true, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'True ∧ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :true, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'False ∨ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :false, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'False ∨ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :false, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	
	end







	describe "#Domination" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :p, :or, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :p, :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'True ∨ P' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'False ∧ P' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of 'True ∨ (P ∨ Q)' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'False ∧ (P ∨ Q)' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	
	end







	describe "#Idempotent" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∨ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∧ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∨ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∨ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∧ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∧ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end	
	end







	describe "#Double_Negation" do
		# NOTE(Drew): Failure tests, variables
		context "Given a source line of 'P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	


		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬(¬P)' and result line of 'P'" do
			line_01 = Proof_Line.new([ [ :not, [ :not, [ :p ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '¬(¬P)' and result line of '(P)'" do
			line_01 = Proof_Line.new([ [ :not, [ :not, [ :p ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		# NOTE(Drew): Failure tests, not variables
		context "Given a source line of '¬(¬P)' and result line of '¬P'" do
			line_01 = Proof_Line.new([ [ :not, [ :not, [ :p ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	


		# NOTE(Drew): Failure tests, arrays
		context "Given a source line of '(P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(¬(P ∨ Q))' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :not, [ :not, [ :p, :or, :q ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '¬(¬(P ∨ Q))' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :not, [ :not, [ :p, :or, :q ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '¬(¬(¬(P ∨ Q)))' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :not, [ :not, [ :not, [ :p, :or, :q ] ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	


		# NOTE(Drew): Failure tests, not arrays
		context "Given a source line of '¬(P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '¬(P ∨ Q)' and result line of '¬P'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '¬(P ∨ Q)' and result line of '¬P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ], :or, :q ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '¬(P ∨ Q)' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	
	end







	describe "#Commutative" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∨ Q' and result line of 'Q ∨ P'" do
			line_01 = Proof_Line.new([ :p, :or, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :or, :p ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∧ Q' and result line of 'Q ∧ P'" do
			line_01 = Proof_Line.new([ :p, :and, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :and, :p ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P → (Q → R)' and result line of 'Q → (P → R)'" do
			line_01 = Proof_Line.new([ :p, :implies, [ :q, :implies, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :implies, [ :p, :implies, :r ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ↔ Q' and result line of 'Q ↔ P'" do
			line_01 = Proof_Line.new([ :p, :bicond, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :bicond, :p ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

=begin  # TODO(Drew): Actually have these working one day. (Equivalence)
		context "Given a source line of '(P ∨ Q) ∨ (R ∨ S)' and result line of '(S ∨ R) ∨ (Q ∨ P)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :s, :or, :r ], :or, [ :q, :or, :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∨ Q) ∧ (R ∨ S)' and result line of '(S ∨ R) ∧ (Q ∨ P)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :s, :or, :r ], :and, [ :q, :or, :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	
=end
	end







	describe "#Associative" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of '(P ∨ Q) ∨ R' and result line of 'P ∨ (Q ∨ R)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, [ :q, :or, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∨ (Q ∨ R)' and result line of '(P ∨ Q) ∨ R'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :or, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, :r ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ∧ Q) ∧ R' and result line of 'P ∧ (Q ∧ R)'" do
			line_01 = Proof_Line.new([ [ :p, :and, :q ], :and, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :and, [ :q, :and, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	
		
		context "Given a source line of 'P ∧ (Q ∧ R)' and result line of '(P ∧ Q) ∧ R'" do
			line_01 = Proof_Line.new([ :p, :and, [ :q, :and, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, :r ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(P ↔ Q) ↔ R' and result line of 'P ↔ (Q ↔ R)'" do
			line_01 = Proof_Line.new([ [ :p, :bicond, :q ], :bicond, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :bicond, [ :q, :bicond, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ↔ (Q ↔ R)' and result line of '(P ↔ Q) ↔ R'" do
			line_01 = Proof_Line.new([ :p, :bicond, [ :q, :bicond, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :bicond, :q ], :bicond, :r ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '((P ∨ Q) ∨ (R ∨ S)) ∨ (U ∨ V)' and result line of '(P ∨ Q) ∨ ((R ∨ S) ∨ (U ∨ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :or, :q ], :or, [ :r, :or, :s ] ], :or, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, [ [ :r, :or, :s ], :or, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '((P ∧ Q) ∧ (R ∧ S)) ∧ (U ∧ V)' and result line of '(P ∧ Q) ∧ ((R ∧ S) ∧ (U ∧ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :and, :q ], :and, [ :r, :and, :s ] ], :and, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, [ [ :r, :and, :s ], :and, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '((P ↔ Q) ↔ (R ↔ S)) ↔ (U ↔ V)' and result line of '(P ↔ Q) ↔ ((R ↔ S) ↔ (U ↔ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :bicond, :q ], :bicond, [ :r, :bicond, :s ] ], :bicond, [ :u, :bicond, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :bicond, :q ], :bicond, [ [ :r, :bicond, :s ], :bicond, [ :u, :bicond, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	
	end







	describe "#Distributive" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∨ (Q ∧ R)' and result line of '(P ∨ Q) ∧ (P ∨ R)'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :and, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :p, :or, :r ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∨ (Q ∨ R)' and result line of '(P ∨ Q) ∨ (P ∨ R)'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :or, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :p, :or, :r ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(Q ∧ R) ∨ P' and result line of '(P ∨ Q) ∧ (P ∨ R)'" do
			line_01 = Proof_Line.new([ [ :q, :and, :r ], :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :p, :or, :r ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(Q ∧ R) ∧ P' and result line of '(P ∧ Q) ∧ (P ∧ R)'" do
			line_01 = Proof_Line.new([ [ :q, :and, :r ], :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, [ :p, :and, :r ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P → (Q → R)' and result line of '(P → Q) ∧ (P → R)'" do
			line_01 = Proof_Line.new([ :p, :implies, [ :q, :implies, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :implies, :q ], :and, [ :p, :implies, :r ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∨ (Q ↔ R)' and result line of '(P ∨ Q) ↔ (P ∨ R)'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :bicond, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :bicond, [ :p, :or, :r ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

=begin # TODO(Drew): Actually get these working. (Equivalence)
		context "Given a source line of 'P ∨ (Q ∧ R)' and result line of '(Q ∨ P) ∧ (R ∨ P)'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :and, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :q, :or, :p ], :and, [ :r, :or, :p ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(Q ∧ R) ∨ P' and result line of '(Q ∨ P) ∧ (R ∨ P)'" do
			line_01 = Proof_Line.new([ [ :q, :and, :r ], :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :q, :or, :p ], :and, [ :r, :or, :p ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∨ (Q ∧ R)' and result line of '(P ∨ R) ∧ (P ∨ Q)'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :and, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :r ], :and, [ :p, :or, :q ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(Q ∧ R) ∨ P' and result line of '(P ∨ R) ∧ (P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :q, :and, :r ], :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :r ], :and, [ :p, :or, :q ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of 'P ∨ (Q ∧ R)' and result line of '(R ∨ P) ∧ (Q ∨ P)'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :and, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :r, :or, :p ], :and, [ :q, :or, :p ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	

		context "Given a source line of '(Q ∧ R) ∨ P' and result line of '(R ∨ P) ∧ (Q ∨ P)'" do
			line_01 = Proof_Line.new([ [ :q, :and, :r ], :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :r, :or, :p ], :and, [ :q, :or, :p ] ], [ 1 ], :distributive)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end	
=end
	end







	describe "#Demorgan" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of '¬(P ∨ Q)' and result line of '¬P ∧ ¬Q'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ], :and, [ :not, [ :q ] ] ], [ 1 ], :demorgan)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∧ Q)' and result line of '¬P ∨ ¬Q'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :and, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ], :or, [ :not, [ :q ] ] ], [ 1 ], :demorgan)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end
	end







	describe "#Absorption" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∨ (P ∧ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :or, [ :p, :and, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :absorption)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∧ (P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :absorption)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns true for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end
		end
	end







	describe "#Negation" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∨ ¬P' and result line of 'True'" do
			line_01 = Proof_Line.new([ :p, :or, [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for absorption" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∧ ¬P' and result line of 'False'" do
			line_01 = Proof_Line.new([ :p, :and, [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :absorption)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for absorption" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end
	end







	describe "#Modus_Ponens" do
		# NOTE(Drew): Success tests, variables
		context "Given source lines of 'P' and 'P → Q' result line of 'Q'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :implies, :q ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q ], [ 1, 2 ], :modus_ponens)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(true)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'P → Q' and 'P' result line of 'Q'" do
			line_01 = Proof_Line.new([ :p, :implies, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q ], [ 1, 2 ], :modus_ponens)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(true)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end
	end







	describe "#Modus_Tollens" do
		# NOTE(Drew): Success tests, variables
		context "Given source lines of '¬Q' and 'P → Q' result line of '¬P'" do
			line_01 = Proof_Line.new([ [ :not, [ :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :implies, :q ], [ ], :assumption)
			line_03 = Proof_Line.new([ [ :not, [ :p ] ] ], [ 1, 2 ], :modus_tollens)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'P → Q' and '¬Q' result line of '¬P'" do
			line_01 = Proof_Line.new([ :p, :implies, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :q ] ] ], [ ], :assumption)
			line_03 = Proof_Line.new([ [ :not, [ :p ] ] ], [ 1, 2 ], :modus_tollens)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end
	end







	describe "#Hypothetical_Syllogism" do
		# NOTE(Drew): Success tests, variables
		context "Given source lines of 'P → Q' and 'Q → R' result line of 'P → R'" do
			line_01 = Proof_Line.new([ :p, :implies, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :implies, :r ], [ ], :assumption)
			line_03 = Proof_Line.new([ :p, :implies, :r ], [ 1, 2 ], :hypothetical_syllogism)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'Q → R' and 'P → Q' result line of 'P → R'" do
			line_01 = Proof_Line.new([ :q, :implies, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :implies, :q ], [ ], :assumption)
			line_03 = Proof_Line.new([ :p, :implies, :r ], [ 1, 2 ], :hypothetical_syllogism)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end
	end







	describe "#Disjunctive_Syllogism" do
		# NOTE(Drew): Success tests, variables
		context "Given source lines of 'P ∨ Q' and '¬P' result line of 'Q'" do
			line_01 = Proof_Line.new([ :p, :or, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ] ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q ], [ 1, 2 ], :disjunctive_syllogism)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of '¬P' and 'P ∨ Q' result line of 'Q'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q ], [ 1, 2 ], :disjunctive_syllogism)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of '¬P ∨ ¬Q' and 'P' result line of '¬Q'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ] ], :or, [ :not, [ :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ ], :assumption)
			line_03 = Proof_Line.new([ [ :not, [ :q ] ] ], [ 1, 2 ], :disjunctive_syllogism)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'P' and '¬P ∨ ¬Q' result line of '¬Q'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ], :or, [ :not, [ :q ] ] ], [ ], :assumption)
			line_03 = Proof_Line.new([ [ :not, [ :q ] ] ], [ 1, 2 ], :disjunctive_syllogism)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end
	end







	describe "#Addition" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :addition)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Addition(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for absorption" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P' and result line of 'Q v P'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :or, :p ], [ 1 ], :addition)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Addition(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for absorption" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for simplification" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(false)
			end
		end
	end







	describe "#Simplification" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∧ Q' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :and, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :simplification)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for absorption" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'Q ∧ P ' and result line of 'P'" do
			line_01 = Proof_Line.new([ :q, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :simplification)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(Evaluator.Simplification(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(Evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(Evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(Evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(Evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(Evaluator.Commutative(proof, line_02)).to eql(false)
			end

			it "returns false for associative" do
				expect(Evaluator.Associative(proof, line_02)).to eql(false)
			end

			it "returns false for distributive" do
				expect(Evaluator.Distributive(proof, line_02)).to eql(false)
			end

			it "returns false for demorgan" do
				expect(Evaluator.Demorgan(proof, line_02)).to eql(false)
			end

			it "returns false for absorption" do
				expect(Evaluator.Absorption(proof, line_02)).to eql(false)
			end

			it "returns false for negation" do
				expect(Evaluator.Negation(proof, line_02)).to eql(false)
			end

			it "returns false for addition" do
				expect(Evaluator.Addition(proof, line_02)).to eql(false)
			end
		end
	end







	describe "#Conjunction" do
		# NOTE(Drew): Success tests, variables
		context "Given source lines of 'P' and 'Q' result line of 'P ∧ Q'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q ], [ ], :assumption)
			line_03 = Proof_Line.new([ :p, :and, :q ], [ 1, 2 ], :conjunction)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'Q' and 'P' result line of 'P ∧ Q'" do
			line_01 = Proof_Line.new([ :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ ], :assumption)
			line_03 = Proof_Line.new([ :p, :and, :q ], [ 1, 2 ], :conjunction)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for resolution" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(false)
			end
		end
	end







	describe "#Resolution" do
		# NOTE(Drew): Success tests, variables
		context "Given source lines of 'P ∨ Q' and '¬P ∨ R' result line of 'Q ∨ R'" do
			line_01 = Proof_Line.new([ :p, :or, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :not, [ :p ] ], :or, :r ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q, :or, :r ], [ 1, 2 ], :resolution)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of '¬P ∨ R' and 'P ∨ Q' result line of 'Q ∨ R'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ] ], :or, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q, :or, :r ], [ 1, 2 ], :resolution)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'Q ∨ P' and 'R ∨ ¬P' result line of 'Q ∨ R'" do
			line_01 = Proof_Line.new([ :q, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :r, :or, [ :not, [ :p ] ] ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q, :or, :r ], [ 1, 2 ], :resolution)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end
		end

		context "Given source lines of 'R ∨ ¬P' and 'Q ∨ P' result line of 'Q ∨ R'" do
			line_01 = Proof_Line.new([ :r, :or, [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :or, :p ], [ ], :assumption)
			line_03 = Proof_Line.new([ :q, :or, :r ], [ 1, 2 ], :resolution)
			proof = [ line_01, line_02, line_03 ]

			it "returns true" do
				expect(Evaluator.Resolution(proof, line_03)).to eql(true)
			end

			it "returns false for modus_ponens" do
				expect(Evaluator.Modus_Ponens(proof, line_03)).to eql(false)
			end

			it "returns false for modus_tollens" do
				expect(Evaluator.Modus_Tollens(proof, line_03)).to eql(false)
			end

			it "returns false for hypothetical_syllogism" do
				expect(Evaluator.Hypothetical_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for disjunctive_syllogism" do
				expect(Evaluator.Disjunctive_Syllogism(proof, line_03)).to eql(false)
			end

			it "returns false for conjunction" do
				expect(Evaluator.Conjunction(proof, line_03)).to eql(false)
			end
		end
	end
end