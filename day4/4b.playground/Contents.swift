import Foundation

let path = Bundle.main.path(forResource: "day4", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).components(separatedBy: "\n") as [String]

var alphabet = [String]()
for character in "abcdefghijklmnopqrstuvwxyz".characters {
    alphabet.append(String(character));
}

for line in input {
    let encryptedName = line.components(separatedBy: "[")[0].components(separatedBy: CharacterSet.decimalDigits)[0].replacingOccurrences(of: "-", with: "")
    let sectorID = line.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")

    var decryptedName = ""
    for char in encryptedName.characters {
        if(char == "-"){
            decryptedName += " "
        } else {
            decryptedName += alphabet[(alphabet.index(of: String(char))! + Int(sectorID)!) % 26]
        }
    }
    
    if decryptedName.range(of: "north") != nil {
        print(sectorID)
        break
    }
}