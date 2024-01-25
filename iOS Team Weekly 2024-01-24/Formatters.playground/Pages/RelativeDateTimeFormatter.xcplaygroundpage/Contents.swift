//: [DateFormatter](@previous)
/**
 iOS 13+
 Отсчет применительно к времени
 */
import Foundation

let locale = Locale(identifier: "ru_RU")
let relativeDateTimeFormatter = RelativeDateTimeFormatter()

relativeDateTimeFormatter.locale = locale // Добавление локали
relativeDateTimeFormatter.unitsStyle = .full // Стиль

let interval: TimeInterval = 9132

let formattedInterval = relativeDateTimeFormatter.localizedString(fromTimeInterval: interval)

print(formattedInterval)

let dateOne = Date()
let dateTwo = dateOne.addingTimeInterval(-interval)
let formattedDateInterval = relativeDateTimeFormatter.localizedString(for: dateOne, relativeTo: dateTwo)

print(formattedDateInterval)
//: [NumberFormatter](@next)
