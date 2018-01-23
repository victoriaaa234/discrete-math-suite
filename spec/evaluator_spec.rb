require "evaluator/evaluator"

describe Evaluator do
	Proof_Line = Struct.new(:sentence, :reference_lines, :type) do end
	evaluator = Evaluator.new()

	describe "All" do
		# NOTE(Drew): Error case tests, single input line
		context "Given an empty source line" do
			line_01 = Proof_Line.new([ ], [ ], nil)
			line_02 = Proof_Line.new([ ], [ ], :nil)
			proof = [ line_01, line_02 ]

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		# NOTE(Drew): Invalid cases that are pattern matches, technically valid
		context "Given a source line of 'False ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns true for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns true for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∨ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns true for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns false for all others" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns true for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns true for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∧ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns true for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
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
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∨ False' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∧ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :true, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∨ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :false, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬P ∧ True' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬P ∨ False' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∧ ¬P' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :true, :and, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∨ ¬P' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :false, :or, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∧ True' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∧ True' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∨ False' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∨ False' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∧ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :true, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∧ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :true, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∨ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :false, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∨ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :false, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(P ∨ Q) ∧ True' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q) ∨ False' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∧ ¬(P ∨ Q)' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :true, :and, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∨ ¬(P ∨ Q)' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :false, :or, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
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
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :p, :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∨ P' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∧ P' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬P ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :or, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬P ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∨ ¬P' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∧ ¬P' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∨ (P ∨ Q)' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∧ (P ∨ Q)' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(P ∨ Q) ∨ True' and result line of 'True'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q) ∧ False' and result line of 'False'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'True ∨ ¬(P ∨ Q)' and result line of 'True'" do
			line_01 = Proof_Line.new([ :true, :or, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'False ∧ ¬(P ∨ Q)' and result line of 'False'" do
			line_01 = Proof_Line.new([ :false, :and, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :domination)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Domination(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
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
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∧ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬P ∨ ¬P' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :or, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬P ∧ ¬P' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :and, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∨ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∨ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∧ (P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∧ (P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(P ∨ Q) ∨ ¬(P ∨ Q)' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q) ∧ ¬(P ∨ Q)' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :idempotent)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
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
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬(¬P)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :not, [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(¬P)' and result line of '(P)'" do
			line_01 = Proof_Line.new([ :not, [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		# NOTE(Drew): Failure tests, not variables
		context "Given a source line of '¬(¬P)' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :not, [ :not, [ :p ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Failure tests, arrays
		context "Given a source line of '(P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q)' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q)' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(¬(P ∨ Q))' and result line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :not, [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, :q ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(¬(P ∨ Q))' and result line of '(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :not, [ :p, :or, :q ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(¬(¬(P ∨ Q)))' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :not, [ :not, [ :p, :or, :q ] ] ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Failure tests, not arrays
		context "Given a source line of '¬(P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q)' and result line of '¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q)' and result line of '¬P ∨ Q'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :or, :q ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q)' and result line of '¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :double_negation)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
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
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'Q ∧ P' and result line of 'P ∧ Q'" do
			line_01 = Proof_Line.new([ :p, :and, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :q, :and, :p ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬P ∨ ¬Q' and result line of '¬Q ∨ ¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :or, :not, [ :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :q ], :or, :not, [ :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬P ∧ ¬Q' and result line of '¬Q ∧ ¬P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :and, :not, [ :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :q ], :and, :not, [ :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∨ (R ∨ S)' and result line of '(R ∨ S) ∨ (P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :r, :or, :s ], :or, [ :p, :or, :q ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∧ (R ∨ S)' and result line of '(R ∨ S) ∧ (P ∨ Q)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :r, :or, :s ], :and, [ :p, :or, :q ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

=begin  # TODO(Drew): Actually have these working one day.
		context "Given a source line of '(P ∨ Q) ∨ (R ∨ S)' and result line of '(S ∨ R) ∨ (Q ∨ P)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :s, :or, :r ], :or, [ :q, :or, :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∧ (R ∨ S)' and result line of '(S ∨ R) ∧ (Q ∨ P)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :s, :or, :r ], :and, [ :q, :or, :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end
=end

		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(P ∨ Q) ∨ ¬(R ∨ S)' and result line of '¬(R ∨ S) ∨ ¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, :not, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :r, :or, :s ], :or, :not, [ :p, :or, :q ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q) ∧ ¬(R ∨ S)' and result line of '¬(R ∨ S) ∧ ¬(P ∨ Q)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :not, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :r, :or, :s ], :and, :not, [ :p, :or, :q ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

=begin  # TODO(Drew): Actually have these working one day.
		context "Given a source line of '¬(P ∨ Q) ∨ ¬(R ∨ S)' and result line of '¬(S ∨ R) ∨ ¬(Q ∨ P)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, :not, [ :r, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :s, :or, :r ], :or, :not, [ :q, :or, :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '¬(P ∨ Q) ∧ ¬(R ∨ S)' and result line of '¬(S ∨ R) ∧ ¬(Q ∨ P)'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :not, [ :r, :or, :s ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :s, :or, :r ], :and, :not, [ :q, :or, :p ] ], [ 1 ], :commutative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Commutative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
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
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∨ (Q ∨ R)' and result line of '(P ∨ Q) ∨ R'" do
			line_01 = Proof_Line.new([ :p, :or, [ :q, :or, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, :r ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∧ Q) ∧ R' and result line of 'P ∧ (Q ∧ R)'" do
			line_01 = Proof_Line.new([ [ :p, :and, :q ], :and, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :and, [ :q, :and, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end
		# TODO(Drew): MORE FLIPS!
		context "Given a source line of 'P ∧ (Q ∧ R)' and result line of '(P ∧ Q) ∧ R'" do
			line_01 = Proof_Line.new([ :p, :and, [ :q, :and, :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, :r ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '(¬P ∨ Q) ∨ R' and result line of '¬P ∨ (Q ∨ R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :or, :q ], :or, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :or, [ :q, :or, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ ¬Q) ∨ R' and result line of 'P ∨ (¬Q ∨ R)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :not, [ :q ] ], :or, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, [ :not, [ :q ], :or, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ Q) ∨ ¬R' and result line of 'P ∨ (Q ∨ R)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, [ :q, :or, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∨ ¬Q) ∨ R' and result line of '¬P ∨ (¬Q ∨ R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :or, :not, [ :q ] ], :or, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :or, [ :not, [ :q ], :or, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∨ ¬Q) ∨ ¬R' and result line of 'P ∨ (¬Q ∨ ¬R)'" do
			line_01 = Proof_Line.new([ [ :p, :or, :not, [ :q ] ], :or, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :or, [ :not, [ :q ], :or, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∨ Q) ∨ ¬R' and result line of '¬P ∨ (Q ∨ ¬R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :or, :q ], :or, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :or, [ :q, :or, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∨ ¬Q) ∨ ¬R' and result line of '¬P ∨ (¬Q ∨ ¬R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :or, :not, [ :q ] ], :or, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :or, [ :not, [ :q ], :or, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∧ Q) ∧ R' and result line of '¬P ∧ (Q ∧ R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :and, :q ], :and, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :and, [ :q, :and, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∧ ¬Q) ∧ R' and result line of 'P ∧ (¬Q ∧ R)'" do
			line_01 = Proof_Line.new([ [ :p, :and, :not, [ :q ] ], :and, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :and, [ :not, [ :q ], :and, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∧ Q) ∧ ¬R' and result line of 'P ∧ (Q ∧ R)'" do
			line_01 = Proof_Line.new([ [ :p, :and, :q ], :and, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :and, [ :q, :and, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∧ ¬Q) ∧ R' and result line of '¬P ∧ (¬Q ∧ R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :and, :not, [ :q ] ], :and, :r ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :and, [ :not, [ :q ], :and, :r ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(P ∧ ¬Q) ∧ ¬R' and result line of 'P ∧ (¬Q ∧ ¬R)'" do
			line_01 = Proof_Line.new([ [ :p, :and, :not, [ :q ] ], :and, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p, :and, [ :not, [ :q ], :and, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∧ Q) ∧ ¬R' and result line of '¬P ∧ (Q ∧ ¬R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :and, :q ], :and, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :and, [ :q, :and, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬P ∧ ¬Q) ∧ ¬R' and result line of '¬P ∧ (¬Q ∧ ¬R)'" do
			line_01 = Proof_Line.new([ [ :not, [ :p ], :and, :not, [ :q ] ], :and, :not, [ :r ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ], :and, [ :not, [ :q ], :and, :not, [ :r ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '((P ∨ Q) ∨ (R ∨ S)) ∨ (U ∨ V)' and result line of '(P ∨ Q) ∨ ((R ∨ S) ∨ (U ∨ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :or, :q ], :or, [ :r, :or, :s ] ], :or, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, [ [ :r, :or, :s ], :or, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∧ Q) ∧ (R ∧ S)) ∧ (U ∧ V)' and result line of '(P ∧ Q) ∧ ((R ∧ S) ∧ (U ∧ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :and, :q ], :and, [ :r, :and, :s ] ], :and, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, [ [ :r, :and, :s ], :and, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '(¬(P ∨ Q) ∨ (R ∨ S)) ∨ (U ∨ V)' and result line of '¬(P ∨ Q) ∨ ((R ∨ S) ∨ (U ∨ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ], :or, [ :r, :or, :s ] ], :or, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, [ [ :r, :or, :s ], :or, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∨ Q) ∨ ¬(R ∨ S)) ∨ (U ∨ V)' and result line of '(P ∨ Q) ∨ (¬(R ∨ S) ∨ (U ∨ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :or, :q ], :or, :not, [ :r, :or, :s ] ], :or, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :not, [ :r, :or, :s ], :or, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∨ Q) ∨ (R ∨ S)) ∨ ¬(U ∨ V)' and result line of '(P ∨ Q) ∨ ((R ∨ S) ∨ ¬(U ∨ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :or, :q ], :or, [ :r, :or, :s ] ], :or, :not, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, [ [ :r, :or, :s ], :or, :not, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∨ Q) ∨ ¬(R ∨ S)) ∨ (U ∨ V)' and result line of '¬(P ∨ Q) ∨ (¬(R ∨ S) ∨ (U ∨ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ], :or, :not, [ :r, :or, :s ] ], :or, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, [ :not, [ :r, :or, :s ], :or, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∨ Q) ∨ ¬(R ∨ S)) ∨ ¬(U ∨ V)' and result line of '(P ∨ Q) ∨ (¬(R ∨ S) ∨ ¬(U ∨ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :or, :q ], :or, :not, [ :r, :or, :s ] ], :or, :not, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ], :or, [ :not, [ :r, :or, :s ], :or, :not, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∨ Q) ∨ (R ∨ S)) ∨ ¬(U ∨ V)' and result line of '¬(P ∨ Q) ∨ ((R ∨ S) ∨ ¬(U ∨ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ], :or, [ :r, :or, :s ] ], :or, :not, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, [ [ :r, :or, :s ], :or, :not, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∨ Q) ∨ ¬(R ∨ S)) ∨ ¬(U ∨ V)' and result line of '¬(P ∨ Q) ∨ (¬(R ∨ S) ∨ ¬(U ∨ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :or, :q ], :or, :not, [ :r, :or, :s ] ], :or, :not, [ :u, :or, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, [ :not, [ :r, :or, :s ], :or, :not, [ :u, :or, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∧ Q) ∧ (R ∧ S)) ∧ (U ∧ V)' and result line of '¬(P ∧ Q) ∧ ((R ∧ S) ∧ (U ∧ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :and, :q ], :and, [ :r, :and, :s ] ], :and, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :and, :q ], :and, [ [ :r, :and, :s ], :and, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∧ Q) ∧ ¬(R ∧ S)) ∧ (U ∧ V)' and result line of '(P ∧ Q) ∧ (¬(R ∧ S) ∧ (U ∧ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :and, :q ], :and, :not, [ :r, :and, :s ] ], :and, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, [ :not, [ :r, :and, :s ], :and, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∧ Q) ∧ (R ∧ S)) ∧ ¬(U ∧ V)' and result line of '(P ∧ Q) ∧ ((R ∧ S) ∧ ¬(U ∧ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :and, :q ], :and, [ :r, :and, :s ] ], :and, :not, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, [ [ :r, :and, :s ], :and, :not, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∧ Q) ∧ ¬(R ∧ S)) ∧ (U ∧ V)' and result line of '¬(P ∧ Q) ∧ (¬(R ∧ S) ∧ (U ∧ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :and, :q ], :and, :not, [ :r, :and, :s ] ], :and, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :and, :q ], :and, [ :not, [ :r, :and, :s ], :and, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '((P ∧ Q) ∧ ¬(R ∧ S)) ∧ ¬(U ∧ V)' and result line of '(P ∧ Q) ∧ (¬(R ∧ S) ∧ ¬(U ∧ V))'" do
			line_01 = Proof_Line.new([ [ [ :p, :and, :q ], :and, :not, [ :r, :and, :s ] ], :and, :not, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :and, :q ], :and, [ :not, [ :r, :and, :s ], :and, :not, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∧ Q) ∧ (R ∧ S)) ∧ ¬(U ∧ V)' and result line of '¬(P ∧ Q) ∧ ((R ∧ S) ∧ ¬(U ∧ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :and, :q ], :and, [ :r, :and, :s ] ], :and, :not, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :and, :q ], :and, [ [ :r, :and, :s ], :and, :not, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of '(¬(P ∧ Q) ∧ ¬(R ∧ S)) ∧ ¬(U ∧ V)' and result line of '¬(P ∧ Q) ∧ (¬(R ∧ S) ∧ ¬(U ∧ V))'" do
			line_01 = Proof_Line.new([ [ :not, [ :p, :and, :q ], :and, :not, [ :r, :and, :s ] ], :and, :not, [ :u, :and, :v ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :and, :q ], :and, [ :not, [ :r, :and, :s ], :and, :not, [ :u, :and, :v ] ] ], [ 1 ], :associative)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Associative(proof, line_02)).to eql(true)
			end

			it "returns false for identity" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end

			it "returns false for domination" do
				expect(evaluator.Domination(proof, line_02)).to eql(false)
			end

			it "returns false for double negation" do
				expect(evaluator.Double_Negation(proof, line_02)).to eql(false)
			end

			it "returns false for idempotent" do
				expect(evaluator.Idempotent(proof, line_02)).to eql(false)
			end

			it "returns false for commutative" do
				expect(evaluator.Commutative(proof, line_02)).to eql(false)
			end
		end
	end
end