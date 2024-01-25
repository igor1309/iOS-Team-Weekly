import Foundation

let dateComponentsFormatter = DateComponentsFormatter()

dateComponentsFormatter.calendar?.locale = Locale(identifier: "ru_RU") // Добавление локали
dateComponentsFormatter.unitsStyle = .abbreviated // Стиль
dateComponentsFormatter.allowedUnits = [.month, .day, .hour, .minute] // Единицы

let interval: TimeInterval = 9132

let formattedInterval = dateComponentsFormatter.string(from: interval)

print(formattedInterval)

let dateOne = Date()
let dateTwo = dateOne.addingTimeInterval(-9132)
let formattedDateInterval = dateComponentsFormatter.string(from: dateOne, to: dateTwo)

print(formattedDateInterval)

