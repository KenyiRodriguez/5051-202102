import UIKit

var arrayEdades: [Int] = [4, 5, 19, 30, 25, 15]
arrayEdades = []

var arrayData: [String] = []
var arrayData1 = [String]()
var arrayData2: [String] = [String]()

arrayData.append("Kenyi")
arrayData.append("Rodolfo")
arrayData.append("Valeria")

arrayData += ["Angel", "Jesus", "Fernanda"]
arrayData.append(contentsOf: ["Angel", "Jesus", "Fernanda"])

for item in arrayData {
    print(item)
}

print("******************************\n")

for index in 0..<arrayData.count {
    print(arrayData[index])
}

print("******************************\n")

for enumerado in arrayData.enumerated() {
    print("\(enumerado.offset) - \(enumerado.element)")
}

print("******************************\n")

arrayData.forEach { elemento in
    print(elemento)
}
