import Foundation

let locale = Locale(identifier: "ru_RU")
let currencyFormatter = NumberFormatter()

currencyFormatter.numberStyle = .currency
currencyFormatter.locale = locale // Добавление локали

let value: NSNumber = 9132.24

print(currencyFormatter.string(from: value))

let numberFormatter = NumberFormatter()

numberFormatter.numberStyle = .decimal
numberFormatter.locale = locale // Добавление локали

print(numberFormatter.string(from: value))

