import UIKit

@propertyWrapper
struct Trimmed {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        set {
            value = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
            print(Date())
        }
    }
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

@propertyWrapper
struct Uppercased {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        
        set {
            
            value = newValue
            for (i, a) in value.enumerated() {
                if a == ".", i < (value.count - 1), value[i + 1] != " " {
                    print("пишем i + 1: " + value[i + 1])
                    
                    value.replaceSubrange(String.Index(encodedOffset: i + 1)..<String.Index(encodedOffset: i + 2), with: value[i + 1].uppercased())
                    
                } else if a == ".", i < (value.count - 2), value[i + 2] != " " {
                    
                    value.replaceSubrange(String.Index(encodedOffset: i + 2)..<String.Index(encodedOffset: i + 3), with: value[i + 2].uppercased())
                }
            }
            
            print(Date())
        }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Post {
    @Trimmed var title: String
    @Uppercased var body: String
}

let quine = Post(title: "   Swift Property Wrappers   ", body: "Swift. is good. but you know")

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(quine.title)
        print(quine.body)
        
    }
    
}

func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
     var chars = Array(myString)     // gets an array of characters
     chars[index] = newChar
     let modifiedString = String(chars)
     return modifiedString
 }

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
