import Foundation

// 1
let value1 = 54
let percent = value1.formatted(.percent)

print(percent)

// 2
let value2: NSNumber = 0.54 // десятичные процентные значения!!!

let percentFormatter = NumberFormatter()

percentFormatter.numberStyle = .percent

print(percentFormatter.string(from: value2))



