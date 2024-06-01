import UIKit

//Array

var myFavoriteMovies = ["Titanic","Interstaller","Lucy","Resservuar Dogs",5,true] as [Any]

myFavoriteMovies[0]
myFavoriteMovies[1]
myFavoriteMovies[2]
myFavoriteMovies[3]
myFavoriteMovies[4]
myFavoriteMovies[5]

var myArray = ["Test5", "Test1", "Test3","Test2"]

myArray[0].uppercased()
myArray.count
myArray[myArray.count - 1]
myArray.last
myArray.sort()

var myNumberArray = [1,2,3,4,5,6,7]
myNumberArray[1]
myNumberArray[1] = 4
myNumberArray[1]

//Set

var myArrayD = [1,2,3,4,5,6,7]
myArrayD.append(8)
print(myArrayD)
var mySet : Set = [1,2,3,4,5,7,6,4,2,1,3,4,5,6,7]
var myStringSet : Set = ["a","b","c","d","a"]
print(mySet)

var myInternetArray = [1,2,3,4,5,6,3,1,2,3,7]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]

var mySet3 = mySet1.union(mySet2)
print(mySet3)

//Dictionary
//Key - Value Pairing

var myFavoriteDirectors = ["Kara Sahinler" : "Ahmet Mümtaz","Kral Merina" : "Ömer Şahiner","Karali Koruyucu" : "Jack Corina"]
print(myFavoriteDirectors["Kara Sahinler"])
myFavoriteDirectors["Kral Merina"]
myFavoriteDirectors["Kara Sahinler"] = "Mehmet Korkmaz"
print(myFavoriteDirectors["Kara Sahinler"])
myFavoriteDirectors["Titanlar"] = "Mehmet Burucu"
print(myFavoriteDirectors)

var myDictionary = ["Run" : 100,"Swim" : 200,"Basketball" : 300]
myDictionary["Run"]
