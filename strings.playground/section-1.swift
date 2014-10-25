// Playground - noun: a place where people can play

import UIKit

var string1 = ""
string1 = "Hello"
let string2 = "World"
var helloWorldString = string1 + " " + string2
helloWorldString = helloWorldString.uppercaseString
helloWorldString = helloWorldString.lowercaseString

var firstCharacter = "!"

helloWorldString = helloWorldString + firstCharacter

let x = 5
let newString = "\(x) times " + helloWorldString
let doubleValue = 3.5
let newDoubleString = "\(doubleValue)" + "!"

let numberString = "9"
let numberStringToInt = numberString.toInt()
var optionalToInt = numberStringToInt!
optionalToInt += 3

let doubleString = "3.9585"
var doubleValueFromString = Double((doubleString as NSString).doubleValue)
doubleValueFromString += 3.85









