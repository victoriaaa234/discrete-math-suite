# This doesn't connect to rails! It's just here to track until a proper backend is built.
# For now, we're just testing a static dataset against logic.tamu.edu until we have an interface
# test using `rails Post.rb`
# Need to be on a *nix system or a windows system with curl. Requires crub and nokogiri
# -Drew

# Annotation equivalent set
# |   | Rosen Book Name      | Our Site Input Format | Logic.Tamu.Edu Name | Logic.Tamu.Edu Format |
# |---|----------------------|-----------------------|---------------------|-----------------------|
# | ! | Identity Laws        | ???                   | ???                 | ???                   |
# | ! | Domination Laws      | ???                   | ???                 | ???                   |
# | ! | Idempotent Laws      | ???                   | ???                 | ???                   |
# |   | Double Negation Laws | ???                   | Double Negation     | 1 DN                  |
# |   | Commutative Laws     | ???                   | &/v Commutativity   | &Comm, vComm          |
# |   | Associative Laws     | ???                   | &/v Associativity   | &Assoc, vAssoc        |
# |   | Distributive Laws    | ???                   | &/v, v/& Distrib.   | &/v Dist, v/& Dist    |
# |   | DeMorgan's Laws      | ???                   | DeMorgan            | DM                    |
# | ! | Absorption Laws      | ???                   | ???                 | ???                   |
# | ! | Negation Laws        | ???                   | ???                 | ???                   |
# |   | Logic Equiv. Condit. | ???                   | Wedge Arrow         | v->                   |
# |   | Logic Equiv. Condit. | ???                   | Negated Arrow       | Neg->                 |
# | * | Logic Equiv. Bicond. | ???                   | Double Arrow Elim.  | <->E                  |
# |   | Logic Equiv. Bicond. | ???                   | Negated<->          | Neg<->                |
# |   | De Morgan's Quantif. | ???                   | Qualifier Exchange  | QE                    |
# |   | Modbus Ponens        | ???                   | Impossible Anteced. | IA                    |
# |   | Modbus Tollens       | ???                   | Modus Tollendo Tol. | MTT                   |
# |   | Hypothetical Syllog. | ???                   | Hypothetical Syllo. | HS                    |
# |   | Disjunctive Syllog.  | ???                   | Wedge Elim.         | vE                    |
# |   | Addition             | ???                   | Wedge Intro.        | vI                    |
# |   | Simplification       | ???                   | Ampersand Elim.     | &E                    |
# |   | Conjunction          | ???                   | Ampersand Intro.    | &I                    |
# | ! | Resolution           | ???                   | ???                 | ???                   |
# |   | Universal Instantia. | ???                   | Universal Elim.     | @E                    |
# |   | Universal Generaliz. | ???                   | Universal Intro.    | @I                    |
# |   | Existential Instant. | ???                   | Existential Elim.   | $E                    |
# |   | Existential General. | ???                   | Existential Intro.  | $I                    |

# Resolution = ((p ∨ q) ∧ (¬p ∨ r)) → (q ∨ r)


# TODO
# Calulate assumption sets from input
# Capture errors about premise and conclusion being bad format
# Reformat input to match logic.tamu.edu layout
# Reformat logic.tamu.edu output to proper site response
# Reformat logic.tamu.edu failure reasons to proper reasons


require 'curb'
require 'nokogiri'

# input_proof = "1 (1) P->Q A\r\n1 (2) ~Q->~P 1Trans\r\n3 (3) ~P->R A\r\n1,3 (4) ~Q->R 2,3HS\r\n5 (5) R->S A\r\n1,3,5 (6) ~Q->S 4,5HS\r\n"
input_proof = "1 (1) P->Q A\r\n1 (2) ~Q->~P 1Trans\r\n3 (3) ~P->R A\r\n1,3 (4) ~Q->R 2,3HS\r\n5 (5) R->S A\r\n"
body_front = "------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"premises\"\r\n\r\nP->Q,~P->R,R->Q\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"conclusion\"\r\n\r\n~Q->S\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"bsubmit\"\r\n\r\nCheck Proof\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"proof\"\r\n\r\n"
body_back = "------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"void\"\r\n\r\nRule : Annotation : Pattern\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt--\r\n"



curl = Curl::Easy.new("http://logic.tamu.edu/cgi-bin/logic.pl")
curl.headers["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
curl.headers["Accept-Encoding"] = "gzip, deflate"
curl.headers["Content-Type"] = "multipart/form-data; boundary=----WebKitFormBoundaryPM7uJXvB7ekZjPLt"
curl.headers["DNT"] = "1"

curl.encoding = 'gzip'
curl.post_body = body_front + input_proof + body_back
curl.http_post

result_page = Nokogiri::HTML(curl.body_str)
simple_failure = result_page.xpath('//center/font').last
error_reason = result_page.xpath('//tr/td/p').last

# puts result_page.text

puts simple_failure.text

if error_reason.text.include? "Congratulations"
	puts "You did it!"
else
	error_params = result_page.xpath('//tr/td/p/tt').last
	error_options = error_params.text.split(/[[:space:]]+/)
	data = {"reason"=>error_reason.text.squeeze(" ").chomp("\n").chomp("\r"), "assumption_set"=>error_options[2], "line_number"=>error_options[3].scan(/\d+/).first, "sentence"=>error_options[4], "annotation"=>error_options[5]}
	puts "You failed. Reason: #{data["reason"]} Assumption Set: #{data["assumption_set"]}, Line Number: #{data["line_number"]}, Sentence: #{data["sentence"]}, Annotation: #{data["annotation"]}"
end
