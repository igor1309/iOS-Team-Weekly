//: [EnergyFormatter](@previous)
/**
 iOS 8+
 Вес
 */
import Foundation

let locale = Locale(identifier: "ru_RU")

let value = 78.6 // double

let massFormatter = MassFormatter()

massFormatter.unitStyle = .long
massFormatter.numberFormatter.locale = locale

print(massFormatter.string(fromValue: value, unit: .gram))
print(massFormatter.string(fromValue: value, unit: .kilogram))
//: [File](@next)
