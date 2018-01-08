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
  # |   | Rando COmpletions    | ???                   | WFF => Well Formed Formulae                  |                       |
  #
mappings = [{:logic => 'Double Negation'                     , :mapping => 'Double Negation Laws'}
             ,{:logic => 'Ampersand Commutativity'            , :mapping => 'Commutative Law'}     
             ,{:logic => 'Wedge Commutativity'                , :mapping => 'Commutative Law'}     
             ,{:logic => 'Ampersand Associativity'            , :mapping => 'Associative Law'}         
             ,{:logic => 'Wedge Associativity'                , :mapping => 'Associative Law'}         
             ,{:logic => 'Ampersand/Wedge Distribution'       , :mapping => 'Distributive Law'}              
             ,{:logic => 'Wedge/Ampersand Distribution'       , :mapping => 'Distributive Law'}                               
             ,{:logic => "de Morgan's Law"                    , :mapping => "DeMorgan's Laws"}
             ,{:logic => 'Wedge Arrow'                        , :mapping => 'Logic Equiv. Condit.'}  
             ,{:logic => 'Negated Arrow'                      , :mapping => 'Logic Equiv. Condit.'} 
             ,{:logic => 'Double Arrow Elim'                  , :mapping => 'Logic Equiv. Bicond.'}               
             ,{:logic => 'Double Arrow Elimination'           , :mapping => 'Logic Equiv. Bicond.'}               
             ,{:logic => 'Negated Double Arrow'               , :mapping => 'Logic Equiv. Bicon'}
             ,{:logic => 'QE'                                 , :mapping => "De Morgan's Quantif."}  
             ,{:logic => 'Arrow Elim'                         , :mapping => 'Modbus Ponens'}              
             ,{:logic => 'Arrow Elimination'                  , :mapping => 'Modbus Ponens'}              
             ,{:logic => 'MTT (Modus Tollendo Tollens)'       , :mapping => 'Modbus Tollens'}                       
             ,{:logic => 'MTT'                                , :mapping => 'Modbus Tollens'}                       
             ,{:logic => 'Hypothetical Syllogism'             , :mapping => 'Hypothetical Syllog.'}     
             ,{:logic => 'Wedge Elimination'                  , :mapping => 'Disjunctive Syllog.'}        
             ,{:logic => 'Wedge Elim'                         , :mapping => 'Disjunctive Syllog.'}        
             ,{:logic => 'Wedge Introduction'                 , :mapping => 'Addition'}                    
             ,{:logic => 'Wedge Intro'                        , :mapping => 'Addition'}                    
             ,{:logic => 'Ampersand Elimination'              , :mapping => 'Simplification'}                 
             ,{:logic => 'Ampersand Elim'                     , :mapping => 'Simplification'}                 
             ,{:logic => 'Ampersand Introduction'             , :mapping => 'Conjunction'}          
             ,{:logic => 'Ampersand Intro'                    , :mapping => 'Conjunction'}          
             ,{:logic => 'Universal Elimination'              , :mapping => 'Universal Instantiation'} 
             ,{:logic => 'Universal Elim'                     , :mapping => 'Universal Instantiation'} 
             ,{:logic => 'Universal Introduction'             , :mapping => 'Universal Generalization'}                              
             ,{:logic => 'Universal Intro'                    , :mapping => 'Universal Generalization'}                              
             ,{:logic => 'Existential Elimination'            , :mapping => 'Existential Instantiation'}                              
             ,{:logic => 'Existential Elim'                   , :mapping => 'Existential Instantiation'}                              
             ,{:logic => 'Existential Introduction'           , :mapping => 'Existential General'}                                
             ,{:logic => 'Existential Intro'                  , :mapping => 'Existential General'}                                
             ,{:logic => 'WFF'                                , :mapping => 'Well Formed Formula'}]                          
                                                                           
mappings.each do |mapping|
  Mapping.create!(mapping)
end  
