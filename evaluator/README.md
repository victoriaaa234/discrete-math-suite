# Evaluator

This is a custom logic evaluator for the logic branch of this repository. It isn't fully complete and doesn't work with the main repository as of yet.

Main things that are missing include:
 - Parser
 - Comprehensive tests of extended proofs
 - Different methods of solving proofs beyond straightforward methods and resolution via RAA.
 - Implementations to handle proofs involving `\forall` and `\exists`
 - Create better error messages

## Missing Features
### Parser

The parser should follow a fairly simplistic grammar. The nature of this grammar is what allows the pattern matching evaluator to operate correctly. The grammar is as follows:

```
not = "\neg"
variable = { 'A' | 'B' | 'C' | ... | 'Y' | 'Z' | 'a' | 'b' | ... | 'y' | 'z' }
operator = { "\implies" | "\iff" | "\lor" | "\land" }
sentence = [ "(" ] variable [ operator variable ] [ ")" ] | [ neg ] "(" sentence ")"
```

In case it is unclear, we'll use an example. Due to the limitations of markdown, we will be using `&` for `and`, `v` for `or`, `~` for `not` and `->` for `implies`.
```
~(P v Q)->(~Q & R)
```
This should be parsed as:
```
[ :not, [ :p, :or, :q ], :implies, [ :not, [ :q ], :and, :r ] ]
```

### Tests

In order to test the evaluator, a series of tests with a proof for each rule should be created. Furthermore, the rules should be tested for all syntactic variations. For example, with Disjunctive Syllogism, a first test would be:
```
Premesis: p \lor q, \neg p
Conclusion: q
Proof
p \lor q |     | A
\neg p   |     | A
q        | 1,2 | Disjunctive Syllogism
```

This test would cover the most simplistic version of a Disjuctive Syllogism, however syntactic variations such as the following should be tested:
```
Premesis: p \lor q, p
Conclusion: \neg q
Proof
p \lor q |     | A
p        |     | A
\neg q   | 1,2 | Disjunctive Syllogism
```

Beyond this, variations including grouped variables should be tested, such as:
```
Premesis: (p \land r) \lor q, \neg (p \land r)
Conclusion: q
Proof
(p \land r) \lor q |     | A
\neg (p \land r)   |     | A
q                  | 1,2 | Disjunctive Syllogism
```

Many more tests beyond these can be constructed for each rule in order to reduce potential errors in the system. However, the error cases of each rule must also be covered by tests. Consider all error cases for each rule, including mismatched variables or even wholly incorrect usage of the rule.

### Different Proof Resolution Methods
Discovering other proof resolution methods and supporting them is an exercise left to the implementer

### Supporting `\forall` and `\exists`
Supporting these operations is an exercise left to the implementer

### Create Better Error Messages
Error messages were generated as quick tests for debugging purposes, but are not suitable for user-facing interactions. They will need to be rewritten to be acceptable.