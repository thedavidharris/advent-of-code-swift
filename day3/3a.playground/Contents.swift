import Foundation

func validTriangle(triangle:[Int]) -> Bool{
    let a = triangle[0]
    let b = triangle[1]
    let c = triangle[2]
    
    return 2*max(a,b,c)<a+b+c
}

let path = Bundle.main.path(forResource: "day3", ofType:"txt")
let input = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
    .trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    .components(separatedBy: "\n")
    .map {
        $0.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            .components(separatedBy: " ")
            .map {
                Int($0) ?? 0
        }
    }.filter {
        validTriangle(triangle: $0)
}

print(input.count)
