import Foundation

//Variable
var greeting = "Hello, playground"
print(greeting)

//Constante
let firstName: String = "Ludovic"

//firstName = "Robert"
// Cannot assign to value: 'firstName' is a 'let' constant

var age: Int = 34
Int.max
UInt.max
Int32.max

let size: Double = 1.837556575757596123456 //64bits
var size2: Float = 1.837556575757596123456 //32bits

//Collections
// Array : Ordonné, indexé
var chronos = [1.65, 1.67, 1.64, 2]
chronos.count
let firstLap = chronos[1]
chronos.append(1.80)
//chronos.removeAll()
chronos.count

var emptyStringArray: [String] = []
//var emptyStringArray2: Array<String> = []
//var emptyStringArray3 = Array<String>()

//Array slice
let slice = chronos[2...4]
let slice2 = chronos[2..<5]

//slice[0] // Imposible car la Slice conserve l'index du tableau d'origine
slice.startIndex
slice.endIndex

let combined = slice + slice2
chronos[2...4] = combined
chronos

var intArray: [Int] = Array()
//intArray.reserveCapacity(10000)

let begin = Date()
for i in 0...10 {
    intArray.append(i)
}
let end = Date()
print(end.timeIntervalSince(begin))

let multipleTypesArray = ["Ludovic", 34] as [Any]
for element in multipleTypesArray {
    element
}

// Dictionary

var dico: [String : String] = ["clé":"valeur",
                               "clé2":"valeur2",
                               "clé3" : "valeur3"]

//dico["firstName"] = "Ludovic"
//dico["firstname"] = "Robert"
dico.updateValue("Ludovic", forKey: "firstName")

let firstNameValue = dico["firstName"]
dico.removeValue(forKey: "firstName")

for truc in dico {
    print(truc.key)
    print(truc.value)
    print("La clé est \(truc.key), et la valeur \(truc.value)")
}

for (clé, _) in dico {
    print(clé)
}

// Set

var cities: Set<String> = ["Paris", "Marseille", "Lyon", "Paris"]
cities.count

cities.insert("Bordeaux")
cities.insert("Bordeaux")

cities.contains("Lyon")
intArray.contains(5)

let visitedCitied: Set = ["Paris", "Bordeaux"]
cities.intersection(visitedCitied)
cities.union(visitedCitied)
cities.subtract(visitedCitied)

cities.remove("Lyon")

print(cities)
let alphabeticalCities = cities.sorted()

// Modélisation

// Structures
// Fonctionnent par copie

struct Human {
    let firstName: String
    var lastName: String
    var age: Int

    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
let me = Human(firstName: "Ludovic",
               lastName: "Ollagnier",
               age: 34)
let somebodyElse = Human(firstName: "Iris",
                         lastName: "Ollagnier",
                         age: 4)
var you = me
you.age = 35

// Classes
// Fonctionnent par référence

class Animal {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init() {
        name = ""
        age = 0
    }
}

class Dog: Animal {
    var race: String

    init(name: String, age: Int, race: String) {
        self.race = race
        super.init(name: name, age: age)
    }

    override init() {
        race = "Berger"
        super.init()
    }
}

let medor = Dog()
medor.age = 5
// medor.name = "Médor"
// Cannot assign to property: 'name' is a 'let' constant

let brutus = medor
brutus.age = 6

print(medor.age)

// Enumerations
// Liste finie de possibilités
enum CompassPoint {
    case north
    case south
    case west
    case east
}

var currentDirection = CompassPoint.north
currentDirection = .east

// Récursion impossible avec struct
//struct A {
//    var b: B
//
//    init(b: B) {
//        self.b = b
//    }
//}
//
//struct B {
//    var a: A
//
//    init(a: A) {
//        self.a = a
//    }
//}

// Optionals

class Human2 {
    let firstName: String
//    var child: Optional<Human2>
    var child: Human2?

    init(firstName: String) {
        self.firstName = firstName
//        child = Optional.none
        child = nil
    }
}

var human = Human2(firstName: "Ludovic")
//human.child = Human2(firstName: "Toto")

if let childName = human.child?.firstName {
    print(childName)
} else {
    print("No child")
}

var capitals = ["France": "Paris", "Espagne":"Madrid"]

// if-let "déballe" (unwrap) l'optional
if let capfrance = capitals["France"]  { // Paris
    print("La capitale de la France est \(capfrance)")
}
var capIrlande = capitals["Irlande"] // nil
print(capIrlande)

capitals["Irlande"] = "Dublin"
capIrlande = capitals["Irlande"]
print(capIrlande)
