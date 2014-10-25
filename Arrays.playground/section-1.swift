// Playground - noun: a place where people can play

import UIKit

//var tigerNames:Array<String>
//var tigerNames: [String]

var tigerNames = ["Tigger", "Tigress", "Jacob", "Spar"]
var tigerAges = [3, 2, 4, 5]

var emptyArray:[String] = []

if emptyArray.isEmpty {
    println("There are no elements in my array")
}
else {
    println("There are elements in my array")
}

println(tigerNames.count)
println(emptyArray.count)

let firstNameFromArray = tigerNames[0]
let secondAgeInTigerAgesArray = tigerAges[1]

for var i = 0; i < tigerNames.count; i++ {
    let instanceFromArray = tigerNames[i]
    println(instanceFromArray)
}

for tigerName in tigerNames {
    println(tigerName)
}

for tigerNumber in 1...5 {
    println(tigerNumber)
}

for (index, tigerName) in enumerate(tigerNames){
    println("index:\(index) tigerName: \(tigerName)")
}
