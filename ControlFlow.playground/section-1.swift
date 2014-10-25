// Playground - noun: a place where people can play

import UIKit

let truckSpeed = 45
let lamboSpeed = 120
var mySpeed:Int
mySpeed = 100
var myFriendsSpeed = 100

if mySpeed < 70 || myFriendsSpeed <= 90 {
    println("Keep cruising")
}
else if (mySpeed > 90) {
    println("My friend's not on the road anymore but I'm going fast!")
}
else if (mySpeed > 100) {
    println("I'm going really fast")
}
else {
    println("Slown down police ahead")
}

let isTelevisionOn = true

if isTelevisionOn == true {
    println("Make sure to turn it off when you're done")
}
else {
    println("Do you want to use this now?")
}