# This doesn't connect to rails! It's just here to track until a proper backend is built.
# For now, we're just testing a static dataset against logic.tamu.edu until we have an interface
# test using `rails Post.rb`
# -Drew

require 'curb'
require 'nokogiri'

curl = Curl::Easy.new("http://logic.tamu.edu/cgi-bin/logic.pl")
curl.headers["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
curl.headers["Accept-Encoding"] = "gzip, deflate"
curl.headers["Content-Type"] = "multipart/form-data; boundary=----WebKitFormBoundaryPM7uJXvB7ekZjPLt"
curl.headers["DNT"] = "1"

curl.encoding = 'gzip'
curl.post_body = "------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"premises\"\r\n\r\nP->Q,~P->R,R->S\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"conclusion\"\r\n\r\n~Q->S\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"bsubmit\"\r\n\r\nCheck Proof\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"proof\"\r\n\r\n1       (1)   P->Q           A         \r\n1       (2)   ~Q->P         1Trans    \r\n3       (3)   ~P->R          A         \r\n1,3     (4)   ~Q->R          2,3HS     \r\n5       (5)   R->S           A         \r\n1,3,5   (6)   ~Q->S          4,5HS  \r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt\r\nContent-Disposition: form-data; name=\"void\"\r\n\r\nRule : Annotation : Pattern\r\n------WebKitFormBoundaryPM7uJXvB7ekZjPLt--\r\n"
curl.http_post

result_page = Nokogiri::HTML(curl.body_str)
error_params = result_page.xpath('//tr/td/p/tt').last
error_reason = result_page.xpath('//tr/td/p').last
error_options = error_params.text.split(/[[:space:]]+/)
data = {"reason"=>error_reason.text.squeeze(" "), "assumption_set"=>error_options[2], "line_number"=>error_options[3].scan(/\d+/).first, "sentence"=>error_options[4], "annotation"=>error_options[5]}
puts data["line_number"]
puts data["reason"]

# puts curl.body_str
