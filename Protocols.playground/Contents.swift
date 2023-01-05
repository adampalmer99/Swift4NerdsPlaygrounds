import Cocoa

func printTable(_ data: [[String]]) {
    for row in data {
        // Start the output string
        var out = "|"
        
        // Append each item in this row to the string
        for item in row {
            out += " \(item) |"
        }
        
        // Done- print it
        print(out)
    }
}

let data = [
["Joe", "30", "6"], ["Karen", "40", "18"], ["Fred", "50", "20"]
]


printTable(data)
