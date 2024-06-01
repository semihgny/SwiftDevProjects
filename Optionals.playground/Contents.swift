import UIKit

var myName : String?

myName?.uppercased()

//optionals : ? vs !

var myAge = "8"

var myNumber = (Int(myAge) ?? 0) * 5

if let num = Int(myAge){
    print(num*5)
}
else{
    print("Wrong Input")
}
