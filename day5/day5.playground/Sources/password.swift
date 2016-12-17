//: Please build the scheme 'CryptoSwiftPlayground' first
import CryptoSwift

public func part1() -> String {
    let path = Bundle.main.path(forResource: "day5", ofType:"txt")
    let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8) as String

    var count = 0
    var password = ""
    while true {
        let str = input + String(count)
        let hash = str.md5()
        let index = hash.index(hash.startIndex, offsetBy: 5)
        if hash.substring(to: index) == "00000" {
            password += String(hash[index])
        }
        if password.characters.count == 8 {
            break
        }
        count += 1
    }

    return password
}
