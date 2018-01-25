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
sentence = [ "(" ] variable [ operator variable ] [ ")" ] | [ not ] "(" sentence ")"
```

Parsing negations is more complex than this simple grammar displays. Each individual negation must be placed with it's own array. For example, `P` is parsed as `[ :p ]` while `¬P` is parsed as `[ [ :not, [ :p ] ] ]`. Notice the extra array. This is so that a negated variable will take up the same index as a non-negated variable.

In case it is unclear, we'll use an example:
```
¬(P ∨ Q) → (¬Q ∧ R)
```
This should be parsed as:
```
[ [ :not, [ :p, :or, :q ] ], :implies, [ [ :not, [ :q ] ], :and, :r ] ]
```

### Tests
Very basic tests are included that test the successful identification of correct uses of each propositional logic law. However, these tests do not check for false positives, and only cover a narrow set of possible ways a user can interact with the proof evaluator. More comprehensive tests of more complete proofs are required to better test the evaluator. Furthermore, malicious input needs to be tested and rooted out. For example, if a user were to enter a line similiar to `P \neg Q`, it is unclear how many of the rules would react.

### Different Proof Resolution Methods
Discovering other proof resolution methods and supporting them is an exercise left to the implementer

### Supporting `\forall` and `\exists`
Supporting these operations is an exercise left to the implementer

### Create Better Error Messages
Error messages were generated as quick tests for debugging purposes, but are not suitable for user-facing interactions. They will need to be rewritten to be acceptable.