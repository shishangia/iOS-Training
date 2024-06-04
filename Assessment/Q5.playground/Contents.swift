import Cocoa

func unwrapStrings (_ inputString: String?) {
    // If Let
    if let ifLetUnwrappedString = inputString {
        print(ifLetUnwrappedString)
    }
    
    // Using ??
    print(inputString ?? "Cannot unwrap string")
    
    // Guard let
    guard let guardLetUnwrappedString = inputString else {
        print("Cannot unwrap string")
        return
    }
    print(guardLetUnwrappedString)

    // Force unwrap
    if inputString != nil {
        print(inputString!)
    }
}

var inputString: String?

inputString = "Hello World!"

unwrapStrings(inputString)
