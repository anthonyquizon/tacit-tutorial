c←•FLines "tacit.bqn"
m←⊑¨1⊸↑¨c='#'
b←∾∾⟜(@+10)¨1⊸↓¨⌾(m⊸/)c

"index.html"•FChars "
<!DOCTYPE html>
<html lang='en'>
<link rel='stylesheet' href='./style.css'>
<head>
  <meta charset='UTF-8'>
  <title></title>
</head>
"∾b∾"
<div>Source: <a href='https://github.com/anthonyquizon/tacit-tutorial'>github.com/anthonyquizon/tacit-tutorial</a></div>
<body>
</html>
"
•Out "wrote index.html"
