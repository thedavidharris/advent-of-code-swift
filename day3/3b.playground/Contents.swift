import Foundation

func validTriangle(a: Int, b: Int, c: Int) -> Int {
    return 2*max(a,b,c)<a+b+c ? 1 : 0
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
    }

// If only Swift would let me zip these....
let triangles0 = input.flatMap {
    $0[0]
}

let triangles1 = input.flatMap {
    $0[1]
}

let triangles2 = input.flatMap {
    $0[2]
}

let triangles = triangles0 + triangles1 + triangles2

var count = 0
for i in stride(from: 0, to: triangles.count - 2, by: 3){
    count += validTriangle(a: triangles[i], b: triangles[i+1], c: triangles[i+2])
}

print(count)