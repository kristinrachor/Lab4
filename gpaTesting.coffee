assert = require 'assert'
convert = require('./routes/gpa').convert
calculate = require('./routes/gpa').calculate

describe "Testing the gpa converter", ->
  it "should return 1.000", ->
    assert.equal(convert("A"), "4.000")
  it "should return 1.000", ->
    assert.equal(convert("A-"), "3.667")
  it "should return 1.000", ->
    assert.equal(convert("B+"), "3.333")
  it "should return 1.000", ->
    assert.equal(convert("B"), "3.000")
  it "should return 1.000", ->
    assert.equal(convert("B-"), "2.667")
  it "should return 1.000", ->
    assert.equal(convert("C+"), "2.333")
  it "should return 1.000", ->
    assert.equal(convert("C"), "2.000")
  it "should return 1.000", ->
    assert.equal(convert("C-"), "1.667")
  it "should return 1.000", ->
    assert.equal(convert("D+"), "1.333")
  it "should return 1.000", ->
    assert.equal(convert("D"), "1.000")
  it "should return 1.000", ->
    assert.equal(convert("D-"), "0.667")
  it "should return 1.000", ->
    assert.equal(convert("F"), "0.000")

describe "Testing the gpa calculator", ->
  it "should return 3.667", ->
    assert.equal(calculate(["A", "B", "A", "A-"], [4, 4, 4, 3]), 3.667)
  it "should return 2.333", ->
    assert.equal(calculate(["F", "B+", "B-", "C+"], [2, 3, 5, 1]), 2.333)
  it "should return 1.282", ->
    assert.equal(calculate(["D", "D-", "C"], [4, 4, 5]), 1.282)
  it "should return 'Insufficient Data'", ->
    assert.equal(calculate(["A", "B", "A", "A-"], []), "Insufficient Data")
  it "should return 'Insufficient Data'", ->
    assert.equal(calculate([], []), "Insufficient Data")
  it "should return 'Insufficient Data'", ->
    assert.equal(calculate([], [4, 4, 4, 3]), "Insufficient Data")
  it "should return 'Insufficient Data'", ->
    assert.equal(calculate(["A", "B", "A"], [4, 4, 4, 3]), "Insufficient Data")
  it "should return 'Insufficient Data'", ->
    assert.equal(calculate(["A", "B", "A", "F"], [4, 4, 4]), "Insufficient Data")

