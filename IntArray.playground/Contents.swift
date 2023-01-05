import Cocoa

//MARK: - Copy on Write
// Refers to the implicit sharing of value types' underlying storage. Allows instances of a value type to share their underlying storage, meaning that each instance does not have its own  copy of the data. Eaach instance maintains it's own reference to the store. If the isntaance needs to mutate the storage or write to it THEN the instance gets its own distinct copy. This means value types avoid creating superfluous copies of data

// IntArrayBuffer is fileprivate class, the class would need to locate its implementation within the same file as IntArray.
// The variable storage has type [Int], which gets initialised to be an empty array in the parameter-less initialiser. An initialiser is supplied that takes an IntArrayBuffer instance as an argument. Added for convenience as will use inside of IntArray implementation.
fileprivate class IntArrayBuffer {
    var storage: [Int]
    
    init() {
        storage = []
    }
    init(buffer: IntArrayBuffer) {
        storage = buffer.storage
    }
}

// IntArray has a private property named buffer that's of type IntArrayBuffer. This maintains the backing storage for IntArray.
//The initialiser takes no arguments and uses the empty initialiser on IntArrayBuffer to set up the array's storage. "describe" helps keep track of changes to the array so can see how COW(Copy on Write) works.
struct IntArray {
    private var buffer: IntArrayBuffer
    
    init() {
        buffer = IntArrayBuffer()
    }
    
    func describe() {
        print(buffer.storage)
    }
    
    // declared as mutating as it creates a new instance of IntArrayBuffer and assigns it to IntArray's buffer property. Used the init(buffer:) initialiser on IntArray that was created above. This initialiser creates a new buffer instance with same set of values for its storage property as the previous buffer. called print() to log info about the change.
    // A NEW BUFFER IS ONLY CREATED IF NEED ONE!
    private mutating func copyIfNeeded() {
        if !isKnownUniquelyReferenced(&buffer) {        // Checks if the buffer has only one reference to it. If yes returns True, if true don't want a new instance created as not needed.
            print("Making a copy of \(buffer.storage)")
            buffer = IntArrayBuffer(buffer: buffer)
        }
    }
    // Mutate an instance.
   mutating func insert(_ value: Int, at index: Int) {
       copyIfNeeded()
        buffer.storage.insert(value, at: index)
    }
   mutating func append(_ value: Int) {
       copyIfNeeded()
        buffer.storage.append(value)
    }
   mutating func remove(at index: Int) {
       copyIfNeeded()
        buffer.storage.remove(at: index)
    }
}

var integers = IntArray()
integers.append(1)
integers.append(2)
integers.append(4)
integers.describe()

//Making a copy of IntArray
print("copying integers to ints")
var ints = integers
print("inserting into ints")
ints.insert(3, at: 2)
integers.describe()
ints.describe()
