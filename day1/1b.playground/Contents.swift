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

// Convert tuple to string
func coordinateToString(coordinate: (Int, Int)) -> String {
    return String(coordinate.0) + "," + String(coordinate.1)
}

func normalizeDirection(bearing: Int, direction: Character) -> Int {
    if direction == "L" {
        return mod(x: (bearing - 90), y: 360)
    } else {
        return mod(x: (bearing + 90), y: 360)
    }
}

func getCoordinate(bearing: Int, coordinate:(Int,Int)) -> (Int,Int){
    switch bearing {
    case 0:
        return(coordinate.0, coordinate.1 + 1)
    case 90:
        return(coordinate.0 + 1, coordinate.1)
    case 180:
        return(coordinate.0, coordinate.1 - 1)
    case 270:
        return(coordinate.0 - 1, coordinate.1)
    // Not needed, above should be exhaustive
    default:
        return coordinate
    }
}

// Read input
let path = Bundle.main.path(forResource: "day1", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8) as String

// Parse instructions
let instructions : [String] = input.replacingOccurrences(of: " ", with: "").components(separatedBy: ",")

// Do things
var bearing = 0
var coordinate = (0,0)
var pointsVisited = Set<String>()


for instruction in instructions {
    let direction = instruction.characters.first
    let steps = Int(instruction.substring(from: instruction.index(after: instruction.startIndex)))
    bearing = normalizeDirection(bearing: bearing, direction: direction!)
    for i in 1...steps! {
        coordinate = getCoordinate(bearing: bearing, coordinate: coordinate)
        
        if pointsVisited.contains(coordinateToString(coordinate: coordinate)){
            print(abs(coordinate.0) + abs(coordinate.1))
            exit(0)
        } else {
            pointsVisited.insert(coordinateToString(coordinate: coordinate))
        }
    }
}

