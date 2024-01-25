/**
 iOS 8+
 Продолжительность применительно к времени
 */
import Foundation

let locale = Locale(identifier: "ru_RU")
let dateComponentsFormatter = DateComponentsFormatter()

dateComponentsFormatter.calendar?.locale = locale // Добавление локали
dateComponentsFormatter.unitsStyle = .abbreviated // Стиль
dateComponentsFormatter.allowedUnits = [.month, .day, .hour, .minute, .second] // Единицы

let interval: TimeInterval = 9132

let formattedInterval = dateComponentsFormatter.string(from: interval)

print(formattedInterval)

let dateOne = Date()
let dateTwo = dateOne.addingTimeInterval(-interval)
dateComponentsFormatter.unitsStyle = .spellOut // Стиль

let formattedDateInterval = dateComponentsFormatter.string(from: dateOne, to: dateTwo)

print(formattedDateInterval)
//: [RelativeDateTimeFormatter](@next)
