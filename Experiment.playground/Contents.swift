//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var options:UIViewAnimationOptions = []

options.insert(.curveEaseInOut) // = .preferredFramesPerSecond60

var hex = String(format: "%x", options.rawValue)

print (hex)

options.insert(.curveEaseIn) // = .preferredFramesPerSecond30

hex = String(format: "%x", options.rawValue)

print (hex)

options.insert(.curveEaseOut) // = .curveEaseInOut

hex = String(format: "%x", options.rawValue)

print (hex)

options.insert(.curveLinear) // = .curveEaseInOut

hex = String(format: "%x", options.rawValue)

print (hex)

var newOption = options.intersection(.curveEaseIn)

hex = String(format: "%x", newOption.rawValue)

newOption = options.symmetricDifference(options.union(.curveEaseIn))

hex = String(format: "%x", newOption.rawValue)

newOption = options.symmetricDifference(options.union(.curveEaseIn))

hex = String(format: "%x", newOption.rawValue)

print (hex)

