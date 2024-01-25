//: [RelativeDateTimeFormatter](@previous)
/**
 iOS 2+
Валюта, разделитель разрядов
 */
import Foundation

let locale = Locale(identifier: "ru_US")
let formatter = NumberFormatter()

formatter.numberStyle = .currency
formatter.locale = locale // Добавление локали

let value: NSNumber = 10

print(formatter.string(from: value))

formatter.numberStyle = .currencyPlural // ios 9+

print(formatter.string(from: value))

formatter.numberStyle = .decimal

print(formatter.string(from: value))
//: [Percent](@next)
