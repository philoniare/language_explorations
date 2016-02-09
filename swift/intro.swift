import Foundation
// Swift is also a statically typed lanugage and features type inference
//  so that developers don't have to explicitly declare types


// Atomic Data Types: String, Double, Float, Int, Bool

var lang = "Swift"
lang = "Ruby"
// lang = 2 will produce an error, because Swift already remembers lang to be a String
print("Value of lang: \(lang)")
// determine type of object
var planets = [String]()
planets = ["Jupiter", "Mercury", "Mars"]
print(planets.dynamicType)

// Dict
var movie = ["title": "Matrix", "year": "1999", "genre": "Fantasy/Action"]
// weird, every key value has to be of the same type, so 1999 can't be inserted as Int
// clearly struct or class is better for this type of data,
// dict is designed for a specific type of data
print(movie["title"])
// looks like it returns an optional, if we tried to access a key that isn't there
// it will return nil


// Loops
for i in 1...5 {            // ... is inclusive range, ..< for exclusive
    print(i)
}

for planet in planets {     // nice intuitive syntax, like python
    switch planet {         // also accepts ranges, e.g. case 0...5
        case "Jupiter":
            print ("\(planet) is the fifth planet from the Sun")
        case "Mercury":
            print ("\(planet) is the one closest to the Sun")
        case "Mars":
            print ("\(planet) is fourth planet from the Sun")
        default:
            print ("Have no idea.")
    }
}


// Functions
func describePlanet(name: String, color: String) -> String {
    print ("\(name) is a \(color) planet.")
    return "retValue"
}

print(describePlanet("Mars", color: "red"))
// interesting, they don't required the param name for the first, but all others
// need to explicitly specified. But the first param name isn't optional either,
// the compiler would err if the name is specified. Clearly they are aiming for a
// specific use case and organization of function parameters.
// Quite opinionated compared to other languages, if you ask me

// Optionals are like pointers for C, you need to build a good model for
// understanding them, because they are ubiquitous.
