import Cocoa

func printTable(_ data: [[String]], withColumnLabels columnLabels: String...) {
    // Create first row containing column headers
    var firstRow = "|"
    
    // Keep track of column width
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    print(firstRow)
    
    for row in data {
        // Start the output string
        var out = "|"
        
        // Append each item in this row to the string
//        for item in row {
//            out += " \(item) |"
//        }
        // Append each item in this row to the String
        for (j, item) in row.enumerated() {
            let paddingNeeded = columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        
        // Done- print it
        print(out)
    }
}

let data = [
["Joe", "30", "6"], ["Karen", "40", "18"], ["Fred", "50", "20"]
]


printTable(data, withColumnLabels: "Employee Name", "Age", "Years of experience")
