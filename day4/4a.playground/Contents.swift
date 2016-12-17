import Foundation

func mostCommonFive(str: String) -> String {
    
    var charCounts = [String:Int]()
    
    for char in str.characters {
        let c = String(char)
        
        if let letter = charCounts[c] {
            charCounts[c] = letter + 1
        } else {
            charCounts[c] = 1
        }
    }
    
    return Array(charCounts).sorted {($0.1, $1.0) > ($1.1, $0.0)}.map{$0.0}[0...4].joined()
}

let path = Bundle.main.path(forResource: "day4", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).components(separatedBy: "\n") as [String]

var sectorSum = 0
for line in input {
    let encryptedName = line.components(separatedBy: "[")[0].components(separatedBy: CharacterSet.decimalDigits)[0].replacingOccurrences(of: "-", with: "")
    let sectorID = line.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
    let checksum = line.components(separatedBy: "[")[1].replacingOccurrences(of: "]", with: "")
    
    if(checksum == mostCommonFive(str: encryptedName)){
        sectorSum += Int(sectorID)!
    }
}

print(sectorSum)