//: [File](@previous)
/**
 iOS 13+
 Список
 */
import Foundation

let list = ["Item1", "Item2", "Item3"]

// 1
let joined = list.joined(separator: ", ")
print(joined)

// 2

let listFormatter = ListFormatter()

listFormatter.locale = Locale(identifier: "ru_RU") // Добавление локали

print(listFormatter.string(from: list))
//: [PersonNameComponents](@next)
