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

input_mppings = [{:outbound => 'Double Negation Laws'          , :mapping => 'DN'},
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
             {:outbound => 'Existential General'           , :mapping => '$I'},
             {:outbound => 'Well Formed Formula'           , :mapping => 'WFF'}]

latex_mappings =  [{:latex => '\lor'                         , :mapping => 'v'},
                   {:latex => '\land'                        , :mapping => '&'},
                   {:latex => '\neg'                         , :mapping => '~'},
                   {:latex => '\forall'                      , :mapping => '@'},
                   {:latex => '\exists'                      , :mapping => 'E'},
                   {:latex => '\Longrightarrow'              , :mapping => '->'},
                   {:latex => '\implies'                     , :mapping => '->'},
                   {:latex => '\Rightarrow'                  , :mapping => '->'},
                   {:latex => '\iff'                         , :mapping => '<->'},
                   {:latex => '\Leftrightarrow'              , :mapping => '<->'}]

response_mappings.each do |mapping|
  ResponseMapping.create!(mapping)
end

input_mappings.each do |mapping|
    InputMapping.create(mapping)
end

latex_mappings.each do |mapping|
  LatexMapping.create!(mapping)
end
