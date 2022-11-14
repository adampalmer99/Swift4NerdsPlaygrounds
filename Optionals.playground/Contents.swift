import Cocoa

//MARK: - Optional types

// Declaring an optional type
var errorCodeString: String?
errorCodeString = "404"

print(errorCodeString)


if errorCodeString != nil { // != means is not equal to
    let theError = errorCodeString! // ! force unwrapped errorCodeString
    print(theError)
}
// forced unwrapping accesses the underlying value of the optional, allows you to grab "404" and assign it to constant theError
// Called forced because it tries to access underlying value whether or not there is a value there at all.

//MARK: - Optional Binding

// BASIC SYNTAX
//if let temporaryConstant = anOptional {
//    // Do something with temporaryConstant
//} else {
//    // There was no value in anOptional, i.e. anOptional is nil
//}

var errorCodeString2: String?
errorCodeString2 = "404"

if let theError2 = errorCodeString2 {
    print(theError2)
}

// theError2 moves to the first line from the body of the conditional(theError, line 13), this makes theError a temporary constant that's available within the first branch of the conditional. So, IF there is a value within the optional a temporary constant is made available for use in the block of code that is executed if the condition is evaluated as true.

// No longer forcibly unwrap the optional, If conversion is successful the operation is done for you, and the optional's value is made available in the temporary constant declared.
// Could have declared theError2 with the var keyword if need to manipulate the value inside the first branch of the conditional

// if want to convert errorString2 to its corresponding integer representation, can do this by nesting if let bindings.

//MARK: - Nesting optional binding

// The second if let takes place within the first, makes theError3 available to use in the second optional binding.

var errorCodeString3: String?
errorCodeString3 = "404"
if let theError3 = errorCodeString3 {
    if let errorCodeInteger = Int(theError3) {
        print("\(theError3): \(errorCodeInteger)")
    }
}

//MARK: - Unwrapping multiple optionals

var errorCodeString4: String?
errorCodeString4 = "404"
if let theError4 = errorCodeString4, let errorCodeInteger = Int(theError4), errorCodeInteger == 404 { // <- additional check
        print("\(theError4): \(errorCodeInteger)")
}

// the final clause "errorCodeInteger == 404" is only executed if both optionals are successfully unwrapped. Because the error is "404", the string can be converted to integer 404, all conditions are met and 404: 404 is logged to console


//MARK: - Implicitly unwrapped optionals


