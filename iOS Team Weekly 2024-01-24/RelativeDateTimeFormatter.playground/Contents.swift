import Foundation

let relativeDateTimeFormatter = RelativeDateTimeFormatter()

relativeDateTimeFormatter.locale = Locale(identifier: "ru_RU") // Добавление локали
relativeDateTimeFormatter.unitsStyle = .full // Стиль

let interval: TimeInterval = 9132

let formattedInterval = relativeDateTimeFormatter.localizedString(fromTimeInterval: interval)

print(formattedInterval)

let dateOne = Date()
let dateTwo = dateOne.addingTimeInterval(-9132)
let formattedDateInterval = relativeDateTimeFormatter.localizedString(for: dateOne, relativeTo: dateTwo)

print(formattedDateInterval)

