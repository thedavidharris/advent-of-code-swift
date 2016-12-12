import Cocoa

var registers: [String:Any] = [
    "a": 0,
    "b": 0,
    "c": 0,
    "d": 0
]

func readRegister(x: String) -> Any {
    if let value = Int(x){
        return value
    } else {
        return registers[x]!
    }
}

let path = Bundle.main.path(forResource: "day12", ofType:"txt")
let instructions = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).components(separatedBy: "\n").map { $0.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).components(separatedBy: " ") }

var ip = 0

while(ip < instructions.count){
    var instruction = instructions[ip]
    if(instruction[0] == "cpy"){
        registers[instruction[2]] = (readRegister(x: instruction[1]))
    }
    if (instruction[0] == "inc") {
        var regValue : Int = registers[instruction[1]] as! Int
        registers[instruction[1]] = regValue + 1
    }
    if (instruction[0] == "dec"){
        var regValue : Int = registers[instruction[1]] as! Int
        registers[instruction[1]] = regValue - 1
    }
    if (instruction[0] == "jnz"){
        var regValue = readRegister(x: instruction[1]) as? Int
        if (regValue != nil && regValue != 0){
            var jumpRegister = readRegister(x: instruction[2]) as! Int
            ip += jumpRegister - 1
        }
    }
    
    ip += 1
}

print(registers["a"]!)


