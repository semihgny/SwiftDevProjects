//
//  main.swift
//  MusicianClass
//
//  Created by Semih Güney on 19.05.2024.
//

import Foundation


//var john = Musicians()

//john.age = 50
//john.name = "John Hetfield"
//john.instrument = "Guitar"

//print(john.instrument)


var james = Musicians(nameInit: "James", ageInit: 50, instrumentInit: "Guitar", typeInit: .Vocalist)

var kirk = ExtraMusician(nameInit: "Kirk", ageInit: 55, instrumentInit: "Guitar", typeInit: .LeadGuitar)

print(james.age)
print(james.type)

//james.sing()

kirk.sing()

