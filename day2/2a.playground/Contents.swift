import Foundation

var numpad = [["1","2","3"],
                ["4","5","6"],
                ["7","8","9"]]

func getNumber(instruction: String, key: (Int, Int)) -> String {
    var key = key
    for char in instruction.characters {
        switch char {
        case "U":
            key.1 = max(0, key.1 - 1)
        case "D":
            key.1 = min(2, key.1 + 1)
        case "L":
            key.0 = max(0, key.0 - 1)
        case "R":
            key.0 = min(2, key.0 + 1)
        // Cases should be exhaustive
        default:
            key.0 = -1
        }
    }
    
    return numpad[key.1][key.0]
}

// Read and parse input
let path = Bundle.main.path(forResource: "day2", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8) as String

var code = ""
var key = (0,0)
for instruction in input.components(separatedBy: "\n") {
    code += getNumber(instruction: instruction, key: key)
}

print(code)



