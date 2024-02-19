//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Algorithms

let names1 = ["Jane", "Elizabeth", "Mary", "Kitty"]
let names2 = ["Daphne", "Eloise", "Francesca", "Hyacinth"]

// временный массив
for name in names1 + names2 {
    print(name)
}

//Chain хранит ссылки
for name in chain(names1, names2) {
    print("Algorithms: \(name)")
}

//Это работает и с другими типами последовательностей

let tooLow = 0...20
let tooHigh = 80...100
let outOfBounds = chain(tooLow, tooHigh)

let value = 35
print(outOfBounds.contains(value))

// В том числе и для любых типов
let reservedSeats = 0...50
let unavailableSeats = [61, 68, 75, 76, 77, 92]
let disallowed = chain(reservedSeats, unavailableSeats)

let requestedSeat = 39
print(disallowed.contains(requestedSeat))


//randomSample(count:)
let lotteryBalls = 1...50
let winningNumbers = lotteryBalls.randomSample(count: 7)
print(winningNumbers)

//сохраняет порядок ваших элементов
let people = ["Chidi", "Eleanor", "Jason", "Tahani"]
let selected = people.randomStableSample(count: 2)
print(selected)


let numbers = 1...1000
let oddNumbers = numbers.striding(by: 2)

for oddNumber in oddNumbers {
    print(oddNumber)
}

let oddNumbersShort = stride(
    from: numbers.lowerBound,
    through: numbers.upperBound,
    by: 2
)

// Эффективное извлечение из строк
let inputString = "a1b2c3d4e5"
let letters = inputString.striding(by: 2)

print(String(letters))


//compacted

let numbers1 = [10, nil, 20, nil, 30]
let safeNumbers = numbers.compactMap { $0 }
print(safeNumbers.count)


let numbers2 = [10, nil, 20, nil, 30]
let safeNumbers1 = numbers2.compacted()
print(Array(safeNumbers1))
