import Cocoa

//switch aValue {
//case someValueToCompare:
//    // Do something to respond
//case anotherValueToCompare:
//    // Do something to respond
//
//default:
//    // Do something when no matches
//}

// If aValue matches any of the comparisons it will execute the body of the matching case


//var statusCode: Int = 404
//var errorString: String
//
//switch statusCode {
//case 400:
//    errorString = "Bad request"
//case 401:
//    errorString = "Unauthorised"
//case 403:
//    errorString = "Forbidden"
//case 404:
//    errorString = "Not found"
//default:
//    errorString = "None"
//}
//
//

//MARK: -  SWITCH CASES CAN HAVE MULTIPLE VALUES

var statusCode: Int = 404
var errorString: String = "The request failed"

switch statusCode {
case 400, 401, 403, 404:
    errorString = "There was something wrong with the request"
    fallthrough
default:
    errorString += "Please review the request and try again "
}
// FALLTHROUGH statements allow you to enter a case and execute its code without having to match against it
// Without the fallthrough keyword, the switch statement would have ended execution after the first match.

//MARK: - RANGES

switch statusCode {
case 100, 101:
    errorString += "informational, 1xx"
case 204:
    errorString += "Successful but no content, 204"
case 300...307:
    errorString += "Redirection, 3xx"
case 400...417:
    errorString += "Client error, 4xx"
case 500...505:
    errorString += "Server error, 5xx"
default:
    errorString = "Unknown. Please review the request and try again"
}


//MARK: - Value Binding

switch statusCode{
case 100, 101:
    errorString += "Informational, \(statusCode)"
case 204:
    errorString += "Successful but no content, 204"
case 300...307:
    errorString += "Redirection, \(statusCode)"
case 400...417:
    errorString += "Client error, \(statusCode)"
case 500...505:
    errorString += "Server error, \(statusCode)"
//case let unkownCode:
//    errorString = "\(unkownCode) is not a known error code"
    
    //^ with the above in place of the default, theres a declared constant with a value that is bound to the status code. this means the final case by definition matched everything that hadn't already matched a case in the switch statement. Switch statement was EXHAUSTIVE. when back on default the switch wasn't exhaustive, so had to add a default case.
default:
    errorString = "\(statusCode) is not a known error code"
}


//MARK: - Where clauses
// using where to create a filter

var statusCode1: Int = 204
var errorString1: String = "The request failed with the error:"

switch statusCode1{
case 100, 101:
    errorString1 += "Informational, \(statusCode1)"
case 204:
    errorString1 += "Successful but no content, 204"
case 300...307:
    errorString1 += "Redirection, \(statusCode1)"
case 400...417:
    errorString1 += "Client error, \(statusCode1)"
case 500...505:
    errorString1 += "Server error, \(statusCode1)"
    
case let unknownCode1 where (unknownCode1 >= 200 && unknownCode1 < 300) || unknownCode1 > 505:
    errorString = "\(unknownCode1) is not a known error code."
    
default:
    errorString1 = "unexpected error encountered"
}


//MARK: - Tuple and pattern matching
// pair statusCode2 and errorString2, they're logically related but stored in independent variables, use a tuple to group the 2- let error2

var statusCode2: Int = 418
var errorString2: String = "The request failed with the error:"

switch statusCode2 {
case 100, 101:
    errorString2 += "Informational, \(statusCode2)"
case 204:
    errorString2 += "Successful but no content, 204"
case 300...307:
    errorString2 += "Redirection, \(statusCode2)"
case 400...417:
    errorString2 += "Client error, \(statusCode2)"
case 500...505:
    errorString2 += "Server error, \(statusCode2)"
    
case let unknownCode2 where (unknownCode2 >= 200 && unknownCode2 < 300) || unknownCode2 > 505:
    errorString2 = "\(unknownCode2) is not a known error code."
    
default:
    errorString2 = "Unexpected error encountered"
    }
//let error2 = (statusCode2, errorString2)
//print(error2)



// Accessing elements of a tuple

//error2.0
//error2.1


// Naming tuples elements

let error2 = (code: statusCode, error: errorString2)
print(error2.error)
print(error2.code)

// pattern matching in tuples

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):
    print("First item not found")
case(_, 404):
    print("Second item not found")
default:
    print("All items found")
}

//MARK: - Switch vs If/else
// Switch statements primarily useful for comparing a value against a number of potentially matching cases.
// If/else are better used for checking against a single condition

// Single case switch
let age = 25
switch age {
case 18...35:
    print("Cool demographic")
default:
    break
}


// If-case
if case 18...35 = age {
    print("Cool demographic")
}

// if-case with multiple conditions

if case 18...35 = age, age >= 21 {
    print("In cool demographic and of drinking age")
}


//MARK: - Bronze Challenge- which case will be logged to console, page47

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")
case (_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered")
}


