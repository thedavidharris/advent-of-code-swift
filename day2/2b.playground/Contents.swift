import Foundation

var numpad = [[nil, nil, "1", nil, nil],
              [nil, "2", "3", "4", nil],
              ["5", "6", "7", "8", "9"],
              [nil, "A", "B", "C", nil],
              [nil, nil, "D", nil, nil]]

func getNumber(instruction: String, key: (Int, Int)) -> String {
    var newKey = key
    for char in instruction.characters {
        let oldKey = newKey
        switch char {
        case "U":
            newKey.1 = max(0, newKey.1 - 1)
        case "D":
            newKey.1 = min(4, newKey.1 + 1)
        case "L":
            newKey.0 = max(0, newKey.0 - 1)
        case "R":
            newKey.0 = min(4, newKey.0 + 1)
        // Cases should be exhaustive so this shouldn't happen
        default:
            newKey = oldKey
        }
        
        // Lazy nil checking for now, sorry optionals :(
        if numpad[newKey.1][newKey.0] == nil {
            newKey = oldKey
        }
    }
    
    return numpad[newKey.1][newKey.0]!
}

// Read and parse input
let path = Bundle.main.path(forResource: "day2", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8) as String

var code = ""
var key = (2,0)
for instruction in input.components(separatedBy: "\n") {
    code += getNumber(instruction: instruction, key: key)
}

print(code)



