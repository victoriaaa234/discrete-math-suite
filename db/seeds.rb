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

response_mappings = [{:logic => 'Double Negation'                     , :mapping => 'Double Negation Laws'},
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
             {:outbound => 'Commutative Law'                   , :mapping => '&Comm'},
             {:outbound => 'Commutative Law'                   , :mapping => 'vComm'},
             {:outbound => 'Associative Law'                   , :mapping => '&Assoc'},
             {:outbound => 'Associative Law'                   , :mapping => 'vAssoc'},
             {:outbound => 'Distributive Law'                  , :mapping => '&/v Dist'},
             {:outbound => 'Distributive Law'                  , :mapping => 'v/& Dist'},
             {:outbound => "DeMorgan's Laws"                   , :mapping => "DM"},
             {:outbound => 'Logic Equiv. Condit.'              , :mapping => 'v->'},
             {:outbound => 'Logic Equiv. Condit. Negated'      , :mapping => 'Neg->'},
             {:outbound => 'Logic Equiv. Bicond.'              , :mapping => '<->E'},
             {:outbound => 'Logic Equiv. Bicond. Negated'      , :mapping => 'Neg<->'},
             {:outbound => "De Morgan's Quantif."              , :mapping => "QE"},
             {:outbound => 'Modus Ponens'                      , :mapping => '->E'},
             {:outbound => 'Modus Tollens'                     , :mapping => 'MTT'},
             {:outbound => 'Hypothetical Syllog.'              , :mapping => 'HS'},
             {:outbound => 'Disjunctive Syllog.'               , :mapping => 'vE'},
             {:outbound => 'Addition'                          , :mapping => 'vI'},
             {:outbound => 'Simplification'                    , :mapping => '&E'},
             {:outbound => 'Conjunction'                       , :mapping => '&I'},
             {:outbound => 'Conjunction'                       , :mapping => '&I'},
             {:outbound => 'Universal Instantiation'           , :mapping => '@E'},
             {:outbound => 'Universal Generalization'          , :mapping => '@I'},
             {:outbound => 'Existential Instantiation'         , :mapping => '$E'},
             {:outbound => 'Existential General'               , :mapping => '$I'},
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
	[0, "Identity Laws"],
	[1, "Domination Laws"],
	[2, "Idempotent Laws"],
	[3, "Double Negation Laws"],
	[4, "Commutative Laws"],
	[5, "Associative Laws"],
	[6, "Distributive Laws"],
	[7, "DeMorgan's Laws"],
	[8, "Absorption Laws"],
	[9, "Negation Laws"],
	[10, "Logical Equivalence Conditional"],
	[11, "Logical Equivalence Biconditional"],
	[12, "De Morgan Laws"],
	[13, "Modus Ponens"],
	[14, "Modus Tollens"],
	[15, "Hypothetical Syllogism"],
	[16, "Disjunctive Syllogism"],
	[17, "Addition"],
	[18, "Simplification"],
	[19, "Conjunction"],
	[20, "Resolution"],
	[21, "Universal Instantiation"],
	[22, "Universal Generalization"],
	[23, "Existential Instantiation"],
	[24, "Existential Generalization"],
	[25, "Random Completions"]
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
	[1, 'p,p->q', 'q', 13],
	[2, 'p,p->q,(qvs)->r','r', 13],
  [3, '~q,p->q','~p',14],
  [4, 'p->q,q->r','p->r',15],
  [5, 'pvq,~p','q',16],
  [6, 'p','pvq',17],
  [7, 'p&q','p',18],
  [8, 'p,q','p&q',19],
  [9, 'pvq,~pvr','qvr',20]
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

problem_categories.each do |category_uid, category_name|
	ProblemCategory.where(category_uid: category_uid,
					      category_name: category_name).first_or_create
end

problem_mappings.each do |problem_uid, premises, conclusion, category_uid|
	PracticeProblem.where(problem_uid: problem_uid,
						   premises: premises, 
						   conclusion: conclusion, 
						   category_uid: category_uid).first_or_create
end
