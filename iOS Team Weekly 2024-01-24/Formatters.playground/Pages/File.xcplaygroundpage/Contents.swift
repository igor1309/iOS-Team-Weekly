//: [MassFormatter](@previous)
/**
 iOS 15+
Размер файла
 */
import Foundation

let number = 543473256

let byteCount = number.formatted(.byteCount(style: .file))

print(byteCount)
//: [ListFormatter](@next)
