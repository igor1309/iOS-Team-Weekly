//: [LengthFormatter](@previous)
/**
 iOS 8+
 Энергия
 */
import Foundation

let locale = Locale(identifier: "ru_RU")

let value = 78.6 // double

let energyFormatter = EnergyFormatter()

energyFormatter.unitStyle = .long
energyFormatter.numberFormatter.locale = locale

print(energyFormatter.string(fromValue: value, unit: .calorie))
print(energyFormatter.string(fromValue: value, unit: .kilojoule))
//: [MassFormatter](@next)
