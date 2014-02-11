convert = (grade) ->
  letterArr = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-", "F"]
  numberArr =  [4.000, 3.667, 3.333, 3.000, 2.667, 2.333, 2.000, 1.667, 1.333, 1.000, 0.667, 0.000]
  holder = letterArr.indexOf(grade)
  toReturn = numberArr[holder]
  toReturn

calculate = (arrGrades, arrCredits) ->
  for x in [0..3]
    if arrGrades[x] == ""
      return "Insufficient Data"
  for x in [0..3]
    if arrCredits[x] == ""
      return "Insufficient Data"
  for x in [0...(arrGrades.length)]
    arrGrades[x] = convert(arrGrades[x])
  holder = []
  for x in [0...(arrGrades.length)]
    holder[x] = arrGrades[x] * arrCredits[x]
  total = 0
  total += int for int in holder
  creditTotal = 0
  creditTotal += int for int in arrCredits
  temp = total/creditTotal
  toReturn = temp.toFixed(3)
  if arrGrades.length != arrCredits.length then (toReturn = "Insufficient Data")
  if arrGrades.length == 0 or arrCredits.length == 0 then (toReturn = "Insufficient Data")
  toReturn

####### HTML to Return #######

headerString = '<!DOCTYPE html>\n
<html>\n
<head>\n
    <title>gpa calculator</title>\n
</head>\n'

calculatorString = '<body>\n
<p>The gpa calculator:</p>\n
    <form method="post" action="/gpa">\n
        <select name="class1">\n
            <option value="" selected="selected"></option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
        <select name="credits1">\n
            <option value="" selected="selected"></option>\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select><br>\n
        <select name="class2">\n
            <option value="" selected="selected"></option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
        <select name="credits2">\n
            <option value="" selected="selected"></option>\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select><br>\n
        <select name="class3">\n
            <option value="" selected="selected"></option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
        <select name="credits3">\n
            <option value="" selected="selected"></option>\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select><br>\n
        <select name="class4">\n
            <option value="" selected="selected"></option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
        <select name="credits4">\n
            <option value="" selected="selected"></option>\n
            <option value="1">1</option>\n
            <option value="2">2</option>\n
            <option value="3">3</option>\n
            <option value="4">4</option>\n
            <option value="5">5</option>\n
        </select>\n
        <input type="submit" id ="submit2" value="Done" />\n
    </form>\n'

footerString = '</body>\n
</html>'

module.exports.convert = convert
module.exports.calculate = calculate

exports.gpaResponse = (req, res) ->
  res.render 'gpa'

exports.postResponse = (req, res) ->
  answer = calculate([req.body.class1, req.body.class2, req.body.class3, req.body.class4],[parseFloat(req.body.credits1), parseFloat(req.body.credits2), parseFloat(req.body.credits3), parseFloat(req.body.credits4)])
  res.send headerString + calculatorString + "<p>Your gpa is: " + answer + "</p>" + footerString