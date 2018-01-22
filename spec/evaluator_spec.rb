require "evaluator/evaluator"

describe Evaluator do
	Proof_Line = Struct.new(:sentence, :reference_lines, :type) do end
	evaluator = Evaluator.new()

	describe ".Identity" do
		# NOTE(Drew): Success tests, variables
		context "Given a source line of 'P ∧ True' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'P ∨ False' and result line of 'P'" do
			line_01 = Proof_Line.new([ :p, :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'True ∧ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :true, :and, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'False ∨ P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :false, :or, :p ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		# NOTE(Drew): Success tests, not variables
		context "Given a source line of '¬P ∧ True' and result line of 'P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of '¬P ∨ False' and result line of 'P'" do
			line_01 = Proof_Line.new([ :not, [ :p ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'True ∧ ¬P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :true, :and, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'False ∨ ¬P' and result line of 'P'" do
			line_01 = Proof_Line.new([ :false, :or, :not, [ :p ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end


		# NOTE(Drew): Success tests, arrays
		context "Given a source line of '(P ∨ Q) ∧ True' and result line of 'P'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of '(P ∨ Q) ∨ False' and result line of 'P'" do
			line_01 = Proof_Line.new([ [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'True ∧ (P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :true, :and, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'False ∨ (P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :false, :or, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end


		# NOTE(Drew): Success tests, not arrays
		context "Given a source line of '¬(P ∨ Q) ∧ True' and result line of 'P'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of '¬(P ∨ Q) ∨ False' and result line of 'P'" do
			line_01 = Proof_Line.new([ :not, [ :p, :or, :q ], :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'True ∧ ¬(P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :true, :and, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'False ∨ ¬(P ∨ Q)' and result line of 'P'" do
			line_01 = Proof_Line.new([ :false, :or, :not, [ :p, :or, :q ] ], [ ], :assumption)
			line_02 = Proof_Line.new([ :not, [ :p, :or, :q ] ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end


		# NOTE(Drew): Invalid cases that are pattern matches, technically valid
		context "Given a source line of 'False ∨ False'" do
			line_01 = Proof_Line.new([ :false, :or, :false ], [ ], :assumption)
			line_02 = Proof_Line.new([ :false ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		context "Given a source line of 'True ∧ True'" do
			line_01 = Proof_Line.new([ :true, :and, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :true ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns true" do
				expect(evaluator.Identity(proof, line_02)).to eql(true)
			end
		end

		# NOTE(Drew): Error case tests
		context "Given an empty source line" do
			line_01 = Proof_Line.new([ ], [ ], nil)
			line_02 = Proof_Line.new([ ], [ ], :nil)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ∨ Q'" do
			line_01 = Proof_Line.new([ :p, :or, :q ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P → True'" do
			line_01 = Proof_Line.new([ :p, :implies, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end
		end

		context "Given a source line of 'P ↔ True'" do
			line_01 = Proof_Line.new([ :p, :bicond, :true ], [ ], :assumption)
			line_02 = Proof_Line.new([ :p ], [ 1 ], :identity)
			proof = [ line_01, line_02 ]

			it "returns false" do
				expect(evaluator.Identity(proof, line_02)).to eql(false)
			end
		end
	end
end