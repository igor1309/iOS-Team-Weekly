//: [Percent](@previous)
/**
 iOS 10+
 Расстояние
 */

import Foundation

let locale = Locale(identifier: "ru_RU")

let measurement1 = Measurement(
    value: 10, // Расстояние
    unit: UnitLength.kilometers // Единица измерения
)

let measurement2 = Measurement(
    value: 1000, // Расстояние
    unit: UnitLength.meters // Единица измерения
)

let measurement3 = Measurement(
    value: 0.99, // Расстояние
    unit: UnitLength.kilometers // Единица измерения
)

let measurement4 = Measurement(
    value: 43.52, // Расстояние
    unit: UnitLength.kilometers // Единица измерения
)

let measurementFormatter = MeasurementFormatter()

measurementFormatter.unitStyle = .long // Стиль
measurementFormatter.locale = locale // Добавление локали
measurementFormatter.unitOptions = .naturalScale // 1000 m-> 1 km

print(measurementFormatter.string(from: measurement1))
print(measurementFormatter.string(from: measurement2))
print(measurementFormatter.string(from: measurement3))
//: [LengthFormatter](@next)
