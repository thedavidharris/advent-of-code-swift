import Foundation

var directionCount: [Int:Int] = [
    0: 0,
    90: 0,
    180: 0,
    270: 0
]

// Modulo function to handle negative numbers
func mod(x: Int, y: Int) -> Int {
    let r = x % y
    return r < 0 ? r + y : r
}

func normalizeDirection(bearing: Int, direction: Character) -> Int {
    if direction == "L" {
        return mod(x: (bearing - 90), y: 360)
    } else {
        return mod(x: (bearing + 90), y: 360)
    }
}

// Read input
let path = Bundle.main.path(forResource: "day1", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8) as String

// Parse instructions
let instructions : [String] = input.replacingOccurrences(of: " ", with: "").components(separatedBy: ",")

// Generate directon count dictionary
var bearing = 0
for instruction in instructions {
    let direction = instruction.characters.first
    let steps = instruction.substring(from: instruction.index(after: instruction.startIndex))
    bearing = normalizeDirection(bearing: bearing, direction: direction!)
    directionCount[bearing]! += Int(steps)!
}


let taxicabDistance = abs(directionCount[0]! - directionCount[180]!) + abs(directionCount[90]! - directionCount[270]!)

print(taxicabDistance)