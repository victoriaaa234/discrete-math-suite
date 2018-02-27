<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Annotation equivalent set
  # |   | Rosen Book Name      | Our Site Input Format | Logic.Tamu.Edu Name                          | Logic.Tamu.Edu Format |
  # |---|----------------------|-----------------------|----------------------------------------------|-----------------------|
  # | ! | Identity Laws        | ???                   | ???                                          | ???                   |
  # | ! | Domination Laws      | ???                   | ???                                          | ???                   |
  # | ! | Idempotent Laws      | ???                   | ???                                          | ???                   |
  # |   | Double Negation Laws | ???                   | Double Negation                              | 1 DN                  |
  # |   | Commutative Laws     | ???                   | Ampersand Commutativity                      | &Comm                 |
  # |   |                      |                       | Wedge Commutativity                          | vComm                 |
  # |   | Associative Laws     | ???                   | Ampersand Associativity                      | &Assoc, vAssoc        |
  # |   |                      |                       | Wedge Associativity                          | vComm                 |
  # |   | Distributive Laws    | ???                   | Ampersand/Wedge Distribution                 | &/v Dist, v/& Dist    |
  # |   |                      | ???                   | Wedge/Ampersand Distribution                 | &/v Dist, v/& Dist    |
  # |   | DeMorgan's Laws      | ???                   | de Morgan's Law                              | DM                    |
  # | ! | Absorption Laws      | ???                   | ???                                          | ???                   |
  # | ! | Negation Laws        | ???                   | ???                                          | ???                   |
  # |   | Logic Equiv. Condit. | ???                   | Wedge Arrow                                  | v->                   |
  # |   | Logic Equiv. Condit. | ???                   | Negated Arrow                                | Neg->                 |
  # | * | Logic Equiv. Bicond. | ???                   | Double Arrow Elim  | Elimination             | <->E                  |
  # |   | Logic Equiv. Bicond. | ???                   | Negated Double Arrow                         | Neg<->                |
  # |   | De Morgan's Quantif. | ???                   | QE                                           | QE                    |
  # |   | Modbus Ponens        | ???                   | Arrow Elim  | Elimination                    | ->E                   |
  # |   | Modbus Tollens       | ???                   | MTT (Modus Tollendo Tollens) | MTT           | MTT                   |
  # |   | Hypothetical Syllog. | ???                   | Hypothetical Syllogism                       | HS                    |
  # |   | Disjunctive Syllog.  | ???                   | Wedge Elim | Elimination                     | vE                    |
  # |   | Addition             | ???                   | Wedge Intro  | Introduction                  | vI                    |
  # |   | Simplification       | ???                   | Ampersand Elim | Elimination                 | &E                    |
  # |   | Conjunction          | ???                   | Ampersand Intro  | Introduction              | &I                    |
  # | ! | Resolution           | ???                   | ???                                          | ???                   |
  # |   | Universal Instantia. | ???                   | Universal Elim | Elimination                 | @E                    |
  # |   | Universal Generaliz. | ???                   | Universal Intro  | Introduction              | @I                    |
  # |   | Existential Instant. | ???                   | Existential Elim  | Elimination              | $E                    |
  # |   | Existential General. | ???                   | Existential Intro  | Introduction            | $I                    |
  # |   | Rando Completions    | ???                   | WFF => Well Formed Formulae                  |                       |

response_mappings = [{:logic => 'Double Negation'            , :mapping => 'Double Negation Laws'},
             {:logic => 'Ampersand Commutativity'            , :mapping => 'Commutative Law'},
             {:logic => 'Wedge Commutativity'                , :mapping => 'Commutative Law'},
             {:logic => 'Ampersand Associativity'            , :mapping => 'Associative Law'},
             {:logic => 'Wedge Associativity'                , :mapping => 'Associative Law'},
             {:logic => 'Ampersand/Wedge Distribution'       , :mapping => 'Distributive Law'},
             {:logic => 'Wedge/Ampersand Distribution'       , :mapping => 'Distributive Law'},
             {:logic => "de Morgan's Law"                    , :mapping => "DeMorgan's Laws"},
             {:logic => 'Wedge Arrow'                        , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Negated Arrow'                      , :mapping => 'Logic Equiv. Condit. Negated'},
             {:logic => 'Double Arrow Elimination'           , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Double Arrow Elim'                  , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Negated Double Arrow'               , :mapping => 'Logic Equiv. Bicon. Negated'},
             {:logic => 'QE'                                 , :mapping => "De Morgan's Quantif."},
             {:logic => 'Arrow Elimination'                  , :mapping => 'Modus Ponens'},
             {:logic => 'Arrow Elim'                         , :mapping => 'Modus Ponens'},
             {:logic => 'MTT (Modus Tollendo Tollens)'       , :mapping => 'Modus Tollens'},
             {:logic => 'MTT'                                , :mapping => 'Modus Tollens'},
             {:logic => 'Hypothetical Syllogism'             , :mapping => 'Hypothetical Syllog.'},
             {:logic => 'Wedge Elimination'                  , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Elim'                         , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Introduction'                 , :mapping => 'Addition'},
             {:logic => 'Wedge Intro'                        , :mapping => 'Addition'},
             {:logic => 'Ampersand Elimination'              , :mapping => 'Simplification'},
             {:logic => 'Ampersand Elim'                     , :mapping => 'Simplification'},
             {:logic => 'Ampersand Introduction'             , :mapping => 'Conjunction'},
             {:logic => 'Ampersand Intro'                    , :mapping => 'Conjunction'},
             {:logic => 'Universal Elimination'              , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Elim'                     , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Introduction'             , :mapping => 'Universal Generalization'},
             {:logic => 'Universal Intro'                    , :mapping => 'Universal Generalization'},
             {:logic => 'Existential Elimination'            , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Elim'                   , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Introduction'           , :mapping => 'Existential General'},
             {:logic => 'Existential Intro'                  , :mapping => 'Existential General'},
             {:logic => 'WFF'                                , :mapping => 'Well Formed Formula'}]

input_mappings = [{:outbound => 'Double Negation Laws'          , :mapping => 'DN'},
             {:outbound => 'Commutative Law AND'                   , :mapping => '&Comm'},
             {:outbound => 'A'                   , :mapping => 'A'},
             {:outbound => 'Commutative Law OR'                   , :mapping => 'vComm'},
             {:outbound => 'Associative Law AND'                   , :mapping => '&Assoc'},
             {:outbound => 'Associative Law OR'                   , :mapping => 'vAssoc'},
             {:outbound => 'Distributive Law AND to OR'                  , :mapping => '&/v Dist'},
             {:outbound => 'Distributive Law OR to AND'                  , :mapping => 'v/& Dist'},
             {:outbound => "DeMorgan's Laws"                   , :mapping => "DM"},
             {:outbound => 'Logic Equivalent Conditional'              , :mapping => 'v->'},
             {:outbound => 'Logic Equivalent Conditional Negated'      , :mapping => 'Neg->'},
             {:outbound => 'Reverse Logic Equivalent Biconditional'              , :mapping => '<->I'},
             {:outbound => 'Logic Equivalent Biconditional'              , :mapping => '<->E'},
             {:outbound => 'Logic Equivalent Biconditional Negated'      , :mapping => 'Neg<->'},
             {:outbound => "De Morgan's Quantifier"              , :mapping => "QE"},
             {:outbound => 'Modus Ponens'                      , :mapping => '->E'},
             {:outbound => 'Modus Tollens'                     , :mapping => 'MTT'},
             {:outbound => 'Hypothetical Syllogism'              , :mapping => 'HS'},
             {:outbound => 'Disjunctive Syllogism'               , :mapping => 'vE'},
             {:outbound => 'Addition'                          , :mapping => 'vI'},
             {:outbound => 'Simplification'                    , :mapping => '&E'},
             {:outbound => 'Conjunction'                       , :mapping => '&I'},
             {:outbound => 'Universal Instantiation'           , :mapping => '@E'},
             {:outbound => 'Universal Generalization'          , :mapping => '@I'},
             {:outbound => 'Existential Instantiation'         , :mapping => '$E'},
             {:outbound => 'Existential Generalization'               , :mapping => '$I'},
             {:outbound => 'Well Formed Formula'               , :mapping => 'WFF'},
             {:outbound => '|'                                 , :mapping => 'v'},
             {:outbound => '!'                                 , :mapping => '~'}]

latex_mappings =  [{:latex => '\lor'                         , :mapping => 'v'},
                   {:latex => '\land'                        , :mapping => '&'},
                   {:latex => '\neg'                         , :mapping => '~'},
                   {:latex => '\forall'                      , :mapping => '@'},
                   {:latex => '\exists'                      , :mapping => 'E'},
                   {:latex => '\Longrightarrow'              , :mapping => '->'},
                   {:latex => '\longrightarrow'              , :mapping => '->'},
                   {:latex => '\implies'                     , :mapping => '->'},
                   {:latex => '\Rightarrow'                  , :mapping => '->'},
                   {:latex => '\rightarrow'                  , :mapping => '->'},
                   {:latex => '\iff'                         , :mapping => '<->'},
                   {:latex => '\Leftrightarrow'              , :mapping => '<->'},
                   {:latex => '\leftrightarrow'              , :mapping => '<->'}]

problem_categories = [
	[0, "Identity Laws", "One of three principles in logic: 1 : a statement (as “a house is a house”) in which the subject and predicate are the same is true. 2 : the copula in an identity affirms an existent of which the identity is true."],
	[1, "Domination Laws", "Gregor Mendel's law stating that when two alleles of an inherited pair is heterozygous, then, the allele that is expressed is dominant whereas the allele that is not expressed is recessive."],
	[2, "Idempotent Laws", "Combining a quantity with itself either by logical addition or logical multiplication will result in a logical sum or product that is the equivalent of the quantity (ex- A + A = A; A x A = A)."],
	[3, "Double Negation Laws", "The law of double negation is the statement that the double negation of a proposition implies that proposition. ¬¬A->A."],
	[4, "Commutative Laws", "Either of two laws relating to number operations of addition and multiplication, stated symbolically: a + b = b + a and ab = ba."],
	[5, "Associative Laws", "Either of two laws relating to number operations of addition and multiplication, stated symbolically: a + (b + c) = (a + b) + c, and a(bc) = (ab)c; that is, the terms or factors may be associated in any way desired."],
	[6, "Distributive Laws", "Multiplying a number by a group of numbers added together is the same as doing each multiplication separately."],
	[7, "DeMorgan's Laws", "The complement of the union of two sets is equal to the intersection of their complements and the complement of the intersection of two sets is equal to the union of their complements."],
	[8, "Absorption Laws", "An identity linking a pair of binary operations. Two binary operations, ¤ and ⁂, are said to be connected by the absorption law if: a ¤ (a ⁂ b) = a ⁂ (a ¤ b) = a."],
	[9, "Negation Laws", "Negate means to make ineffective or invalid; to deny the truth or existence of something."],
	[10, "Logical Equivalence Conditional", "p->q is false if, and only if, its hypothesis, p, is true and its conclusion, q, is false. The converse and inverse of a conditional statement are logically equivalent to each other, but neither of them are logically equivalent to the conditional statement."],
	[11, "Logical Equivalence Biconditional", ""],
	[12, "De Morgan Laws", "The complement of the union of two sets is equal to the intersection of their complements and the complement of the intersection of two sets is equal to the union of their complements."],
	[13, "Modus Ponens", "The rule of logic stating that if a conditional statement (“if p then q ”) is accepted, and the antecedent ( p ) holds, then the consequent ( q ) may be inferred."],
	[14, "Modus Tollens", "The rule of logic stating that if a conditional statement (“if p then q ”) is accepted, and the consequent does not hold ( not-q ), then the negation of the antecedent ( not-p ) can be inferred."],
	[15, "Hypothetical Syllogism", "A valid argument form which is a syllogism having a conditional statement for one or both of its premises.
"],
[16, "Disjunctive Syllogism", "A valid argument form which is a syllogism having a disjunctive statement for one of its premises."],
	[17, "Addition", "When two events, A and B, are mutually exclusive, the probability that A or B will occur is the sum of the probability of each event."],
	[18, "Simplification", "The rule of simplification is a valid deduction sequent in propositional logic."],
	[19, "Conjunction", "A conjunction is a compound statement formed by joining two statements with the connector AND."],
	[20, "Resolution", "A rule of inference leading to a refutation theorem-proving technique for sentences in propositional logic and first-order logic"],
	[21, "Universal Instantiation", "A valid rule of inference from a truth about each member of a class of individuals to the truth about a particular individual of that class"],
	[22, "Universal Generalization", "...is a valid inference rule. It states that if has been derived, then can be derived."],
	[23, "Existential Instantiation", "A valid rule of inference which says that, given a formula of the form , one may infer for a new constant or variable symbol c"],
	[24, "Existential Generalization", "A valid rule of inference that allows one to move from a specific statement, or one instance, to a quantified generalized statement, or existential proposition."]
]

# problems = [{:premise => 'p,p->q',   :problem => 'Modus Ponens',  :conclusion => 'q'},
#                     {:premise => 'p,p->q,(qvs)->r', :problem => 'Modus Ponens', :conclusion =>'r'},
#                     {:premise => '~q,p->q', :problem => 'Modus Tollens', :conclusion =>'~p'},
#                     {:premise => 'p->q,q->r', :problem => 'Hypothesical Syllogism', :conclusion =>'p->r'},
#                     {:premise => 'pvq,~p', :problem => 'Disjuctive Syllogism', :conclusion =>'q'},
#                     {:premise => 'p', :problem => 'Addition', :conclusion =>'pvq'},
#                     {:premise => 'p&q', :problem => 'Simplification', :conclusion =>'p'},
#                     {:premise => 'p,q', :problem => 'Conjuction', :conclusion =>'p&q'},
#                     {:premise => 'pvq,~pvr', :problem => 'Resolution', :conclusion =>'qvr'}]



problem_mappings = [
  [0,'','',-1],
	[1, 'p,p->q', 'q', 13],
	[2, 'p,p->q,(qvs)->r','r', 13],
  [3, '~q,p->q','~p',14],
  [4, 'p->q,q->r','p->r',15],
  [5, 'pvq,~p','q',16],
  [6, 'p','pvq',17],
  [7, 'p&q','p',18],
  [8, 'p,q','p&q',19],
  [9,'`~(p->q)','p&~q',3],
  [10,'~(pv(~p&q))','~p&~q',4],
  [11,'(p&q)->(pvq)','(~pvp)v(~qvq)',5],
  [12,'(~p&(pv~q)','~p&~q',6],
  [13,'~(pv(~p&q))','~p&~q',7],
  [14,'p->q','~q->~p',10],
  [15,'p<->q','(p&q)v(~p&~q)',11],
  [16,'$(Px&Rx)','Pa',21],
  [17,'$(PxVQx)','$(Pxv$Qx)',22],
  [18,'@~Px,$(PxvQx),$(~QxvSx),$(Rx->~Sx)','@~Rx',23],
  [19,'@~Px,$(PxvQx),$(~QxvSx),$(Rx->~Sx)','@~Rx',24],
  [20,'~~p','p',3]
  ]

response_mappings.each do |mapping|
	ResponseMapping.where(mapping).first_or_create
end

input_mappings.each do |mapping|
	InputMapping.where(mapping).first_or_create
end

latex_mappings.each do |mapping|
	LatexMapping.where(mapping).first_or_create
end

problem_categories.each do |category_uid, category_name, category_description|
	ProblemCategory.where(category_uid: category_uid,
					      category_name: category_name,
						  category_description: category_description).first_or_create
end

problem_mappings.each do |problem_uid, premises, conclusion, category_uid|
	PracticeProblem.where(problem_uid: problem_uid,
						   premises: premises, 
						   conclusion: conclusion, 
						   category_uid: category_uid).first_or_create
end


=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Annotation equivalent set
  # |   | Rosen Book Name      | Our Site Input Format | Logic.Tamu.Edu Name                          | Logic.Tamu.Edu Format |
  # |---|----------------------|-----------------------|----------------------------------------------|-----------------------|
  # | ! | Identity Laws        | ???                   | ???                                          | ???                   |
  # | ! | Domination Laws      | ???                   | ???                                          | ???                   |
  # | ! | Idempotent Laws      | ???                   | ???                                          | ???                   |
  # |   | Double Negation Laws | ???                   | Double Negation                              | 1 DN                  |
  # |   | Commutative Laws     | ???                   | Ampersand Commutativity                      | &Comm                 |
  # |   |                      |                       | Wedge Commutativity                          | vComm                 |
  # |   | Associative Laws     | ???                   | Ampersand Associativity                      | &Assoc, vAssoc        |
  # |   |                      |                       | Wedge Associativity                          | vComm                 |
  # |   | Distributive Laws    | ???                   | Ampersand/Wedge Distribution                 | &/v Dist, v/& Dist    |
  # |   |                      | ???                   | Wedge/Ampersand Distribution                 | &/v Dist, v/& Dist    |
  # |   | DeMorgan's Laws      | ???                   | de Morgan's Law                              | DM                    |
  # | ! | Absorption Laws      | ???                   | ???                                          | ???                   |
  # | ! | Negation Laws        | ???                   | ???                                          | ???                   |
  # |   | Logic Equiv. Condit. | ???                   | Wedge Arrow                                  | v->                   |
  # |   | Logic Equiv. Condit. | ???                   | Negated Arrow                                | Neg->                 |
  # | * | Logic Equiv. Bicond. | ???                   | Double Arrow Elim  | Elimination             | <->E                  |
  # |   | Logic Equiv. Bicond. | ???                   | Negated Double Arrow                         | Neg<->                |
  # |   | De Morgan's Quantif. | ???                   | QE                                           | QE                    |
  # |   | Modbus Ponens        | ???                   | Arrow Elim  | Elimination                    | ->E                   |
  # |   | Modbus Tollens       | ???                   | MTT (Modus Tollendo Tollens) | MTT           | MTT                   |
  # |   | Hypothetical Syllog. | ???                   | Hypothetical Syllogism                       | HS                    |
  # |   | Disjunctive Syllog.  | ???                   | Wedge Elim | Elimination                     | vE                    |
  # |   | Addition             | ???                   | Wedge Intro  | Introduction                  | vI                    |
  # |   | Simplification       | ???                   | Ampersand Elim | Elimination                 | &E                    |
  # |   | Conjunction          | ???                   | Ampersand Intro  | Introduction              | &I                    |
  # | ! | Resolution           | ???                   | ???                                          | ???                   |
  # |   | Universal Instantia. | ???                   | Universal Elim | Elimination                 | @E                    |
  # |   | Universal Generaliz. | ???                   | Universal Intro  | Introduction              | @I                    |
  # |   | Existential Instant. | ???                   | Existential Elim  | Elimination              | $E                    |
  # |   | Existential General. | ???                   | Existential Intro  | Introduction            | $I                    |
  # |   | Rando Completions    | ???                   | WFF => Well Formed Formulae                  |                       |

mappings = [{:logic => 'Double Negation'                     , :mapping => 'Double Negation Laws'},
             {:logic => 'Ampersand Commutativity'            , :mapping => 'Commutative Law'},
             {:logic => 'Wedge Commutativity'                , :mapping => 'Commutative Law'},
             {:logic => 'Ampersand Associativity'            , :mapping => 'Associative Law'},
             {:logic => 'Wedge Associativity'                , :mapping => 'Associative Law'},
             {:logic => 'Ampersand/Wedge Distribution'       , :mapping => 'Distributive Law'},
             {:logic => 'Wedge/Ampersand Distribution'       , :mapping => 'Distributive Law'},
             {:logic => "de Morgan's Law"                    , :mapping => "DeMorgan's Laws"},
             {:logic => 'Wedge Arrow'                        , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Negated Arrow'                      , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Double Arrow Elim'                  , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Double Arrow Elimination'           , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Negated Double Arrow'               , :mapping => 'Logic Equiv. Bicon'},
             {:logic => 'QE'                                 , :mapping => "De Morgan's Quantif."},
             {:logic => 'Arrow Elim'                         , :mapping => 'Modus Ponens'},
             {:logic => 'Arrow Elimination'                  , :mapping => 'Modus Ponens'},
             {:logic => 'MTT (Modus Tollendo Tollens)'       , :mapping => 'Modus Tollens'},
             {:logic => 'MTT'                                , :mapping => 'Modus Tollens'},
             {:logic => 'Hypothetical Syllogism'             , :mapping => 'Hypothetical Syllog.'},
             {:logic => 'Wedge Elimination'                  , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Elim'                         , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Introduction'                 , :mapping => 'Addition'},
             {:logic => 'Wedge Intro'                        , :mapping => 'Addition'},
             {:logic => 'Ampersand Elimination'              , :mapping => 'Simplification'},
             {:logic => 'Ampersand Elim'                     , :mapping => 'Simplification'},
             {:logic => 'Ampersand Introduction'             , :mapping => 'Conjunction'},
             {:logic => 'Ampersand Intro'                    , :mapping => 'Conjunction'},
             {:logic => 'Universal Elimination'              , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Elim'                     , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Introduction'             , :mapping => 'Universal Generalization'},
             {:logic => 'Universal Intro'                    , :mapping => 'Universal Generalization'},
             {:logic => 'Existential Elimination'            , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Elim'                   , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Introduction'           , :mapping => 'Existential General'},
             {:logic => 'Existential Intro'                  , :mapping => 'Existential General'},
             {:logic => 'WFF'                                , :mapping => 'Well Formed Formula'}]

mappings.each do |mapping|
  Mapping.create!(mapping)
end

#User.destroy_all

User.create!(name:  "Example User",
             email: "example@railstutorial.org")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  User.create!(name:  name,
               email: email)
end
>>>>>>> induction
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Annotation equivalent set
  # |   | Rosen Book Name      | Our Site Input Format | Logic.Tamu.Edu Name                          | Logic.Tamu.Edu Format |
  # |---|----------------------|-----------------------|----------------------------------------------|-----------------------|
  # | ! | Identity Laws        | ???                   | ???                                          | ???                   |
  # | ! | Domination Laws      | ???                   | ???                                          | ???                   |
  # | ! | Idempotent Laws      | ???                   | ???                                          | ???                   |
  # |   | Double Negation Laws | ???                   | Double Negation                              | 1 DN                  |
  # |   | Commutative Laws     | ???                   | Ampersand Commutativity                      | &Comm                 |
  # |   |                      |                       | Wedge Commutativity                          | vComm                 |
  # |   | Associative Laws     | ???                   | Ampersand Associativity                      | &Assoc, vAssoc        |
  # |   |                      |                       | Wedge Associativity                          | vComm                 |
  # |   | Distributive Laws    | ???                   | Ampersand/Wedge Distribution                 | &/v Dist, v/& Dist    |
  # |   |                      | ???                   | Wedge/Ampersand Distribution                 | &/v Dist, v/& Dist    |
  # |   | DeMorgan's Laws      | ???                   | de Morgan's Law                              | DM                    |
  # | ! | Absorption Laws      | ???                   | ???                                          | ???                   |
  # | ! | Negation Laws        | ???                   | ???                                          | ???                   |
  # |   | Logic Equiv. Condit. | ???                   | Wedge Arrow                                  | v->                   |
  # |   | Logic Equiv. Condit. | ???                   | Negated Arrow                                | Neg->                 |
  # | * | Logic Equiv. Bicond. | ???                   | Double Arrow Elim  | Elimination             | <->E                  |
  # |   | Logic Equiv. Bicond. | ???                   | Negated Double Arrow                         | Neg<->                |
  # |   | De Morgan's Quantif. | ???                   | QE                                           | QE                    |
  # |   | Modbus Ponens        | ???                   | Arrow Elim  | Elimination                    | ->E                   |
  # |   | Modbus Tollens       | ???                   | MTT (Modus Tollendo Tollens) | MTT           | MTT                   |
  # |   | Hypothetical Syllog. | ???                   | Hypothetical Syllogism                       | HS                    |
  # |   | Disjunctive Syllog.  | ???                   | Wedge Elim | Elimination                     | vE                    |
  # |   | Addition             | ???                   | Wedge Intro  | Introduction                  | vI                    |
  # |   | Simplification       | ???                   | Ampersand Elim | Elimination                 | &E                    |
  # |   | Conjunction          | ???                   | Ampersand Intro  | Introduction              | &I                    |
  # | ! | Resolution           | ???                   | ???                                          | ???                   |
  # |   | Universal Instantia. | ???                   | Universal Elim | Elimination                 | @E                    |
  # |   | Universal Generaliz. | ???                   | Universal Intro  | Introduction              | @I                    |
  # |   | Existential Instant. | ???                   | Existential Elim  | Elimination              | $E                    |
  # |   | Existential General. | ???                   | Existential Intro  | Introduction            | $I                    |
  # |   | Rando Completions    | ???                   | WFF => Well Formed Formulae                  |                       |

mappings = [{:logic => 'Double Negation'                     , :mapping => 'Double Negation Laws'},
             {:logic => 'Ampersand Commutativity'            , :mapping => 'Commutative Law'},
             {:logic => 'Wedge Commutativity'                , :mapping => 'Commutative Law'},
             {:logic => 'Ampersand Associativity'            , :mapping => 'Associative Law'},
             {:logic => 'Wedge Associativity'                , :mapping => 'Associative Law'},
             {:logic => 'Ampersand/Wedge Distribution'       , :mapping => 'Distributive Law'},
             {:logic => 'Wedge/Ampersand Distribution'       , :mapping => 'Distributive Law'},
             {:logic => "de Morgan's Law"                    , :mapping => "DeMorgan's Laws"},
             {:logic => 'Wedge Arrow'                        , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Negated Arrow'                      , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Double Arrow Elim'                  , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Double Arrow Elimination'           , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Negated Double Arrow'               , :mapping => 'Logic Equiv. Bicon'},
             {:logic => 'QE'                                 , :mapping => "De Morgan's Quantif."},
             {:logic => 'Arrow Elim'                         , :mapping => 'Modus Ponens'},
             {:logic => 'Arrow Elimination'                  , :mapping => 'Modus Ponens'},
             {:logic => 'MTT (Modus Tollendo Tollens)'       , :mapping => 'Modus Tollens'},
             {:logic => 'MTT'                                , :mapping => 'Modus Tollens'},
             {:logic => 'Hypothetical Syllogism'             , :mapping => 'Hypothetical Syllog.'},
             {:logic => 'Wedge Elimination'                  , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Elim'                         , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Introduction'                 , :mapping => 'Addition'},
             {:logic => 'Wedge Intro'                        , :mapping => 'Addition'},
             {:logic => 'Ampersand Elimination'              , :mapping => 'Simplification'},
             {:logic => 'Ampersand Elim'                     , :mapping => 'Simplification'},
             {:logic => 'Ampersand Introduction'             , :mapping => 'Conjunction'},
             {:logic => 'Ampersand Intro'                    , :mapping => 'Conjunction'},
             {:logic => 'Universal Elimination'              , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Elim'                     , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Introduction'             , :mapping => 'Universal Generalization'},
             {:logic => 'Universal Intro'                    , :mapping => 'Universal Generalization'},
             {:logic => 'Existential Elimination'            , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Elim'                   , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Introduction'           , :mapping => 'Existential General'},
             {:logic => 'Existential Intro'                  , :mapping => 'Existential General'},
             {:logic => 'WFF'                                , :mapping => 'Well Formed Formula'}]

mappings.each do |mapping|
  Mapping.create!(mapping)
end

User.destroy_all

User.create!(name:  "User Database",
             email: "example@railstutorial.org",
             section: "1")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  section = "1"
  User.create!(name:  name,
               email: email,
               section: section)
end

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  section = "2"
  User.create!(name:  name,
               email: email,
               section: section)
end

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  section = "3"
  User.create!(name:  name,
               email: email,
               section: section)
end
>>>>>>> induction
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Annotation equivalent set
  # |   | Rosen Book Name      | Our Site Input Format | Logic.Tamu.Edu Name                          | Logic.Tamu.Edu Format |
  # |---|----------------------|-----------------------|----------------------------------------------|-----------------------|
  # | ! | Identity Laws        | ???                   | ???                                          | ???                   |
  # | ! | Domination Laws      | ???                   | ???                                          | ???                   |
  # | ! | Idempotent Laws      | ???                   | ???                                          | ???                   |
  # |   | Double Negation Laws | ???                   | Double Negation                              | 1 DN                  |
  # |   | Commutative Laws     | ???                   | Ampersand Commutativity                      | &Comm                 |
  # |   |                      |                       | Wedge Commutativity                          | vComm                 |
  # |   | Associative Laws     | ???                   | Ampersand Associativity                      | &Assoc, vAssoc        |
  # |   |                      |                       | Wedge Associativity                          | vComm                 |
  # |   | Distributive Laws    | ???                   | Ampersand/Wedge Distribution                 | &/v Dist, v/& Dist    |
  # |   |                      | ???                   | Wedge/Ampersand Distribution                 | &/v Dist, v/& Dist    |
  # |   | DeMorgan's Laws      | ???                   | de Morgan's Law                              | DM                    |
  # | ! | Absorption Laws      | ???                   | ???                                          | ???                   |
  # | ! | Negation Laws        | ???                   | ???                                          | ???                   |
  # |   | Logic Equiv. Condit. | ???                   | Wedge Arrow                                  | v->                   |
  # |   | Logic Equiv. Condit. | ???                   | Negated Arrow                                | Neg->                 |
  # | * | Logic Equiv. Bicond. | ???                   | Double Arrow Elim  | Elimination             | <->E                  |
  # |   | Logic Equiv. Bicond. | ???                   | Negated Double Arrow                         | Neg<->                |
  # |   | De Morgan's Quantif. | ???                   | QE                                           | QE                    |
  # |   | Modbus Ponens        | ???                   | Arrow Elim  | Elimination                    | ->E                   |
  # |   | Modbus Tollens       | ???                   | MTT (Modus Tollendo Tollens) | MTT           | MTT                   |
  # |   | Hypothetical Syllog. | ???                   | Hypothetical Syllogism                       | HS                    |
  # |   | Disjunctive Syllog.  | ???                   | Wedge Elim | Elimination                     | vE                    |
  # |   | Addition             | ???                   | Wedge Intro  | Introduction                  | vI                    |
  # |   | Simplification       | ???                   | Ampersand Elim | Elimination                 | &E                    |
  # |   | Conjunction          | ???                   | Ampersand Intro  | Introduction              | &I                    |
  # | ! | Resolution           | ???                   | ???                                          | ???                   |
  # |   | Universal Instantia. | ???                   | Universal Elim | Elimination                 | @E                    |
  # |   | Universal Generaliz. | ???                   | Universal Intro  | Introduction              | @I                    |
  # |   | Existential Instant. | ???                   | Existential Elim  | Elimination              | $E                    |
  # |   | Existential General. | ???                   | Existential Intro  | Introduction            | $I                    |
  # |   | Rando Completions    | ???                   | WFF => Well Formed Formulae                  |                       |

mappings = [{:logic => 'Double Negation'                     , :mapping => 'Double Negation Laws'},
             {:logic => 'Ampersand Commutativity'            , :mapping => 'Commutative Law'},
             {:logic => 'Wedge Commutativity'                , :mapping => 'Commutative Law'},
             {:logic => 'Ampersand Associativity'            , :mapping => 'Associative Law'},
             {:logic => 'Wedge Associativity'                , :mapping => 'Associative Law'},
             {:logic => 'Ampersand/Wedge Distribution'       , :mapping => 'Distributive Law'},
             {:logic => 'Wedge/Ampersand Distribution'       , :mapping => 'Distributive Law'},
             {:logic => "de Morgan's Law"                    , :mapping => "DeMorgan's Laws"},
             {:logic => 'Wedge Arrow'                        , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Negated Arrow'                      , :mapping => 'Logic Equiv. Condit.'},
             {:logic => 'Double Arrow Elim'                  , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Double Arrow Elimination'           , :mapping => 'Logic Equiv. Bicond.'},
             {:logic => 'Negated Double Arrow'               , :mapping => 'Logic Equiv. Bicon'},
             {:logic => 'QE'                                 , :mapping => "De Morgan's Quantif."},
             {:logic => 'Arrow Elim'                         , :mapping => 'Modus Ponens'},
             {:logic => 'Arrow Elimination'                  , :mapping => 'Modus Ponens'},
             {:logic => 'MTT (Modus Tollendo Tollens)'       , :mapping => 'Modus Tollens'},
             {:logic => 'MTT'                                , :mapping => 'Modus Tollens'},
             {:logic => 'Hypothetical Syllogism'             , :mapping => 'Hypothetical Syllog.'},
             {:logic => 'Wedge Elimination'                  , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Elim'                         , :mapping => 'Disjunctive Syllog.'},
             {:logic => 'Wedge Introduction'                 , :mapping => 'Addition'},
             {:logic => 'Wedge Intro'                        , :mapping => 'Addition'},
             {:logic => 'Ampersand Elimination'              , :mapping => 'Simplification'},
             {:logic => 'Ampersand Elim'                     , :mapping => 'Simplification'},
             {:logic => 'Ampersand Introduction'             , :mapping => 'Conjunction'},
             {:logic => 'Ampersand Intro'                    , :mapping => 'Conjunction'},
             {:logic => 'Universal Elimination'              , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Elim'                     , :mapping => 'Universal Instantiation'},
             {:logic => 'Universal Introduction'             , :mapping => 'Universal Generalization'},
             {:logic => 'Universal Intro'                    , :mapping => 'Universal Generalization'},
             {:logic => 'Existential Elimination'            , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Elim'                   , :mapping => 'Existential Instantiation'},
             {:logic => 'Existential Introduction'           , :mapping => 'Existential General'},
             {:logic => 'Existential Intro'                  , :mapping => 'Existential General'},
             {:logic => 'WFF'                                , :mapping => 'Well Formed Formula'}]

mappings.each do |mapping|
  Mapping.create!(mapping)
end

User.destroy_all

User.create!(name:  "User Database",
             email: "example@railstutorial.org",
             section: "1",
             image: "https://images.petsmartassets.com/is/image/PetSmart/ARHERO-GrumpyCatTellsAll-20170102?$AR0301$")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  section = "1"
  image = "https://images.petsmartassets.com/is/image/PetSmart/ARHERO-GrumpyCatTellsAll-20170102?$AR0301$"
  User.create!(name:  name,
               email: email,
               section: section,
               image: image)
end

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  section = "2"
  image = "https://images.petsmartassets.com/is/image/PetSmart/ARHERO-GrumpyCatTellsAll-20170102?$AR0301$"
  User.create!(name:  name,
               email: email,
               section: section,
               image: image)
end

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  section = "3"
  image = "https://images.petsmartassets.com/is/image/PetSmart/ARHERO-GrumpyCatTellsAll-20170102?$AR0301$"
  User.create!(name:  name,
               email: email,
               section: section,
               image: image)
end
>>>>>>> induction
