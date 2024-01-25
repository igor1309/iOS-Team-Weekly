//: [MeasurementFormatter](@previous)
/**
 iOS 8+
 Размер
 */
import Foundation

let locale = Locale(identifier: "ru_RU")

let value1 = 1000.0 // double
let value2 = 12.3 // double

let lengthFormatter = LengthFormatter()

lengthFormatter.unitStyle = .long
lengthFormatter.numberFormatter.locale = locale

print(lengthFormatter.string(fromValue: value1, unit: .millimeter))
print(lengthFormatter.string(fromMeters: value1))
print(lengthFormatter.string(fromValue: value2, unit: .millimeter))
print(lengthFormatter.string(fromMeters: value2))
//: [EnergyFormatter](@next)
