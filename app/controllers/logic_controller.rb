class LogicController < ApplicationController
  def logic
    if params[:submit] == 'Proof'
      premises = params[:premises].join(',')
      conclusion = params[:conclusion]
      proof_lines = params[:proof_lines]
      parse_input(premises, conclusion, proof_lines)
    end	
  end

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
  
  # Resolution = ((p ∨ q) ∧ (¬p ∨ r)) → (q ∨ r)


  # TODO
  # - WHO IS DOING INPUT CHECKING???
  # - Calculate assumption sets from input
  # - Reformat input to match logic.tamu.edu layout
  # - Reformat logic.tamu.edu output to proper site response
  # - Reformat logic.tamu.edu failure reasons to proper reasons

  # - Incorrect assumption
  # - The expression is not well formed

  # ERROR TYPES
  # - Proof is not finished
  # - Premise is wrong
  # - Conclusion is wrong
  # - Incorrect usage of each individual rule
  # - Line numbers for use in proof are not correct (Can prove before send via assumption set calculation?)
  # - Assumption is made that isn't in premises and isn't resolved by the proof


  def calc_assumption_set(input_proof)
    length = input_proof.length
    assumption_set = Array.new(length)
    input_proof.each_with_index do |proof_line, index|
      dependent_lines = proof_line[1].split(',')
      if dependent_lines.nil? || dependent_lines.empty?
        if proof_line[2] == "A" || proof_line[2] == "a"
          assumption_set[index] = Array(index + 1)
        else
          # TODO(Drew): Throw error!
        end
      else
        # Use the lines used by the proof to find a valid assumption set
        assumption_set[index] = Array.new
        dependent_lines.each do |line|
          line_num = line.to_i - 1
          assumption_set[index].concat(assumption_set[line_num])
        end
        assumption_set[index] = assumption_set[index].uniq

        # Removes values from assumption set that match (#) syntax.
        exclusion_match = proof_line[2][/(?<=\()[\d]+(?=\))/].to_i
        if !exclusion_match.nil?
          assumption_set[index].delete(exclusion_match)
        end
      end
    end
    return assumption_set
  end

  def parse_input(premises, conclusion, proof)
    input_premesis_str = "p->r,r->q"
    input_conclusion_str =  "p->q"
    input_proof = [ [ "p->r", "", "A" ], [ "r->q", "", "A" ], [ "p", "", "A" ], [ "r", "1,3", "->E" ], [ "q", "2,4", "->E"], [ "p->q", "5", "->I(3)" ] ]
    assumption_set = calc_assumption_set(input_proof)

    # Format output to logic.tamu.edu format
    formatted_proof = String.new
    input_proof.each_with_index do |line, index|
      formatted_proof << assumption_set[index].join(",") << " (" << (index + 1).to_s << ") " << line[0] << " " << line[1] << line[2] << "\r\n"
    end

    post(input_premesis_str, input_conclusion_str, formatted_proof)
  end

  def post(formatted_premesis, formatted_conclusion, formatted_proof)
    # input_premesis = "P->R,R->Q"
    # input_conclusion = "P->Q"
    # input_proof = "1       (1)   p->r           A\r\n2       (2)   r->q           A\r\n3       (3)   p              A\r\n1,3     (4)   r              1,3->E\r\n1,2,3   (5)   q              2,4->E\r\n1,2     (6)   p->q              5->I(3)\r\n"
    body_stage_1 = "------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"premises\"\r\n\r\n"
    body_stage_2 = "\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"conclusion\"\r\n\r\n"
    body_stage_3 = "\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"bsubmit\"\r\n\r\nCheck Proof\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"proof\"\r\n\r\n"
    body_stage_4 = "------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"void\"\r\n\r\nRule : Annotation : Pattern\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt--\r\n"



    curl = Curl::Easy.new("http://logic.tamu.edu/cgi-bin/logic.pl")
    curl.headers["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
    curl.headers["Accept-Encoding"] = "gzip, deflate"
    curl.headers["Content-Type"] = "multipart/form-data; boundary=----WebKitFormBoundaryPM7uJXvB7ekZjPLt"
    curl.headers["DNT"] = "1"

    curl.encoding = 'gzip'
    curl.post_body = body_stage_1 + formatted_premesis + body_stage_2 + formatted_conclusion + body_stage_3 + formatted_proof + body_stage_4
    curl.http_post

    result_page = Nokogiri::HTML(curl.body_str)

    error_reason = result_page.xpath("//tr/td/p/img[@src='http://logic.tamu.edu/Images/th_up.gif']").last
    unless error_reason.nil?
      puts "You did it!"
      return
    end

    # Parse errors. First marron errors, then red ones, then traditional errors
    error_reason = result_page.xpath("//font[@color='maroon']").text
    unless error_reason.empty?
      puts "Maroon case"
      puts error_reason
      return
    end

    # Hey. This is probably going to crash if some new edge case shows. Heads up. Should probably fix this.
    error_reason = result_page.xpath("//font[@color='red']").first.parent.text
    unless error_reason.empty?
      puts "Red case"
      error_message = result_page.xpath('//tr/td/p').last.text
      error_options = error_reason.split(/[[:space:]]+/)
      data = {"reason"=>error_message, "assumption_set"=>error_options[2], "line_number"=>error_options[3].scan(/\d+/).first, "sentence"=>error_options[4], "annotation"=>error_options[5]}
      puts "You failed. Reason: #{data["reason"]} Assumption Set: #{data["assumption_set"]}, Line Number: #{data["line_number"]}, Sentence: #{data["sentence"]}, Annotation: #{data["annotation"]}"
      return
    end

    puts "You missed an error."
  end

  def format_output(error_message)
        
  end
end
