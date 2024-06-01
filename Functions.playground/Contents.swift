import UIKit

func myFunction(){
    
    print("Hello World")
    
}

myFunction()

func sumFunction(x: Int , y: Int) -> Int{
    
return x + y
}

var myFunctionVariable = sumFunction(x: 7 , y: 5)

print(myFunctionVariable)

func logicFunction(x: Int , y: Int) -> String {
    if x > y{
        return "Greater"
    }
    else{
        return "Less"
    }
}

logicFunction(x: 2, y: 5)
