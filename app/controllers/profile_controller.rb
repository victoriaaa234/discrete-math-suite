class ProfileController < ApplicationController
	def profilePage
		@topics = ["Identity Laws", "Domination Laws", "Idempotent Laws", "Double Negation Laws", "Commutative Laws", "Associative Laws", "Distributive Laws", "DeMorgan's Laws", "Absorption Laws", "Negation Laws", "Logical Equivalence Conditional", "Logical Equivalence Biconditional", "De Morgan Laws", "Modus Ponens", "Modus Tollens", "Hypothetical Syllogism", "Disjunctive Syllogism", "Addition", "Simplification", "Conjunction", "Resolution", "Universal Instantiation", "Universal Generalization", "Existential Instantiation", "Existential Generalization", "Random Completions"]
	end
end

