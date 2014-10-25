// Playground - noun: a place where people can play

import UIKit

typealias WholeNumber = Int
typealias NumberWithDecimal = Double

var x = 49
var y = 10

var additionAnswer = x + y
var multiply = x*y
var subtract = x-y
var divide = x/y

var discountOnShoesAtStore = 0.3
var priceOfShoes:Double = 33
var priceAfterDiscount = priceOfShoes * (1.0 - discountOnShoesAtStore)
var downPayment = 10.5
priceAfterDiscount = priceAfterDiscount - downPayment

var z = 33
z = 44

var largeNumber = 1_000_000_000_000 //easier to read than 1000000000000
