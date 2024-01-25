//: [NumberFormatter](@previous)
/**
 Проценты
 */

import Foundation

// 1
let value1 = 54
let percent1 = value1.formatted(.percent)
print(percent1)

// 2
let value2 = 54.0
let percent2 = value2.formatted(.percent)

print(percent2)

// 2
let value3: NSNumber = 0.54 // десятичные процентные значения!!!

let percentFormatter = NumberFormatter()

percentFormatter.numberStyle = .percent

print(percentFormatter.string(from: value3))

//: [MeasurementFormatter](@next)
