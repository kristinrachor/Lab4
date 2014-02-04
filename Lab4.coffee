#Refactored to make it iterate forward and backwards after both tests passed.
createArray = (direction, min, max) ->
  if(direction == "forward") then toReturn = (x for x in [min..max])
  if(direction == "backward") then toReturn = (x for x in [max..min])
  toReturn

copyArray = (array) ->
  toReturn = (int for int in array)
  toReturn

sliceArray = () ->
  array = [1, 2, 3, 4, 5, 6]
  toReturn = array[...-1]
  toReturn

negativeBeginning = (array) ->
  toReturn = copyArray(array)
  toReturn[..1] = [-1, -2]
  toReturn

makeZeros = (array) ->
  toReturn = copyArray(array)
  toReturn[1..] = [0, 0, 0, 0]
  toReturn

invert = (array, firstIndex, secondIndex) ->
  toReturn = copyArray(array)
  copy = []
  j = 0
  for i in [secondIndex..firstIndex]
    copy[j] = toReturn[i]
    j++
  toReturn[firstIndex..secondIndex] = copy
  toReturn

############ Tests ############
assert = require 'assert'

arr = [1, 2, 3, 4, 5]
arr2 = [5, 4, 3, 2, 1]
arr3 = [-1, -2, 3, 4, 5]
arr4 = [1, 0, 0, 0, 0]
arr5 = [1, 4, 3, 2, 5]
arr6 = [3, 8, 5, 9, 1]
arr7 = [3, 9, 5, 8, 1]

describe "testing 'for' loops", ->
  it "should create array [1, 2, 3, 4, 5]", ->
    assert.deepEqual(createArray("forward", 1, 5), arr)
  it "should create array [5, 4, 3, 2, 1]", ->
    assert.deepEqual(createArray("backward", 1, 5), arr2)
  it "should return a copy of given array", ->
    assert.deepEqual(copyArray(arr), arr)
describe "testing array slicing and splicing", ->
  it "should omitt the end", ->
    assert.deepEqual(sliceArray(), arr)
  it "should make the beginning negative", ->
    assert.deepEqual(negativeBeginning(arr), arr3)
  it "should make entire array 0's except the first element", ->
    assert.deepEqual(makeZeros(arr), arr4)
  it "should invert part of the array", ->
    assert.deepEqual(invert(arr, 1, 3), arr5)
  it "should invert part of the array", ->
    assert.deepEqual(invert(arr6, 1, 3), arr7)
