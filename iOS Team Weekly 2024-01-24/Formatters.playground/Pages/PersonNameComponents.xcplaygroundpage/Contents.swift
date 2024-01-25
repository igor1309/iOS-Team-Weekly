//: [ListFormatter](@previous)
/**
 iOS 9+
 Имена
 */
import Foundation

let locale = Locale(identifier: "ru_RU")

var nameComponents = PersonNameComponents()
nameComponents.familyName = "Иванов"
nameComponents.middleName = "Петрович"
nameComponents.givenName = "Иван"
nameComponents.nameSuffix = "Младший"
nameComponents.nickname = "Ваня"

let nameFormatter = PersonNameComponentsFormatter()
nameFormatter.locale = locale // Добавление локали

nameFormatter.style = .default // совпадает с `.medium` или отсутствием стиля
print(nameFormatter.string(from: nameComponents))

nameFormatter.style = .short
print(nameFormatter.string(from: nameComponents))

nameFormatter.style = .abbreviated
print(nameFormatter.string(from: nameComponents))

nameFormatter.style = .long
print(nameFormatter.string(from: nameComponents))
//: [DateComponentsFormatter](@first)
