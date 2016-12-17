import Foundation

func mostCommon(str: String) -> String {
    
    var charCounts = [String:Int]()
    
    for char in str.characters {
        let c = String(char)
        
        if let letter = charCounts[c] {
            charCounts[c] = letter + 1
        } else {
            charCounts[c] = 1
        }
    }
    
    return Array(charCounts).sorted {($0.1, $1.0) > ($1.1, $0.0)}.map{$0.0}[0]
}

func leastCommon(str: String) -> String {
    
    var charCounts = [String:Int]()
    
    for char in str.characters {
        let c = String(char)
        
        if let letter = charCounts[c] {
            charCounts[c] = letter + 1
        } else {
            charCounts[c] = 1
        }
    }
    
    return Array(charCounts).sorted {($0.1, $1.0) < ($1.1, $0.0)}.map{$0.0}[0]
}

let path = Bundle.main.path(forResource: "day6", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).components(separatedBy: "\n").map {
    Array($0.characters)
}

var columns = [String]()

for i in 0...input[0].count - 1 {
    var column = input.flatMap {
        $0[i]
    }
    columns.append(String(column))
}

var part1 = ""
for column in columns {
    part1 += mostCommon(str: column)
}

var part2 = ""
for column in columns {
    part2 += leastCommon(str: column)
}

print("Part 1: " + part1)
print("Part 2: " + part2)




