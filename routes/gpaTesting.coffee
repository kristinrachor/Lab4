assert = require 'assert'
convert = require('./gpa').convert


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


