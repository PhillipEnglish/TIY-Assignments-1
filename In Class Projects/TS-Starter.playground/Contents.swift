//: # Tailored Swift
//: As tradition dictates, any exploration of a new language needs to start with "hello, world"
let helloString = "Hello, World"
print(helloString)


//: Semi-colons, not required, unless you place multiple instructions on the same line
let greeting = "Hello"; print(greeting)


//: Identifiers, first character A-Z or a-z or _, followed by any of these plus 0-9
let theIronYard = "awesome", tiy100 = "100%", _travelBack = "1985"



//: Constants are declared with 'let' keyword
let students = 11
let tiyStaff = 4
let totalPeople = students + tiyStaff



//: Variables are declared with 'var' keyword
var appleCount = 10
appleCount += 2


//: Above values determined implicitly, below shows explicit types
let explicitInteger: Int = 70
let explicitDouble: Double = 70.1
let explicitBool: Bool = true


//: Data types in Swift
let anInt: Int = 4
let aFloat: Float = 2.5
let aDouble: Double = 4000.25
let aBool: Bool = false
let aString: String = "The Iron Yard"
let aChar: Character = "C"


//: Type safety: once a var's data type is set, it cannot hold a value of any other type
var life = 42
//life = "the ultimate anser to life, the universe and everything"


//: Types are never automatically converted
let label = "The width is "
let width = 94
let widthLabel = label + String(width)


//: String interpolation and concatenation
let heightLabel = "The height is " + "100"
let anotherWidthLabel = "The width is \(width + 10)"


//: Literals, just a value
42 // integer literal
3.14159 // double literal
"Hello, World!" // string literal


//: Simple arithmetic
//: +, -, *, / allowed. Also ++, --, and %
let oneHundred = 100
let oneQuarter = 25
let dollarsWorth = oneHundred / oneQuarter

let quotient = 5 / 4
let quotientWithRemainder = 5.0 / 4.0

let ten = 10
let quarter = 2.5
let answer2 = Double(ten) / quarter


//: Logical operators
//: >, <, ==, >=, <=, !=
if ten*ten == oneHundred
{
    print("values are equal.")
}
else
{
    print("values are not equal.")
}


//: Ranges
//: First is inclusive of last value, second is not
1...5
1..<5


//: ## Collections
//: ### Arrays
let shipCaptains = ["Malcom Reynolds", "Jean-Luc Picard", "James T. Kirk", "Hans Solo"]
let sameCaptains = ["Malcom Reynolds", "Jean-Luc Picard", "James T. Kirk", "Hans Solo"]

if shipCaptains == sameCaptains {
    print("arrays are equal")
}
else {
    print("arrays are not equal")
}

var moreCaptains = shipCaptains
moreCaptains.append("Kathryn Janeway")

moreCaptains[3]
//: #### Array filtering
let testArray = [0,1,2,3,4,5,6,7,8,9,10]
let odds = testArray.filter{$0 % 2 == 1}
let evens = testArray.filter{$0 % 2 == 0}

odds
evens


//: ### Dictionaries
var occupations = ["Malcolm Reynolds": "Captain", "Kaylee": "Mechanic"]
occupations["Malcolm Reynolds"]
occupations["Jayne"] = "Public Relations"
occupations


//: ## Control flow
//: ### for loop
let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}

teamScore

//: ### switch
let vegetable = "red pepper"
switch vegetable
{
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
    default:
        let vegetableComment = "Everything tastes good in soup."
}


//: ## Comments

// A single line comment is one with two slashes as the first characters

/*
A multi-line comment
is one that is bounded by
/* and */ characters
*/

//: ## Testing a UIKit component in a playground

import UIKit

class TestDataSource : NSObject, UITableViewDataSource
{
    let sortedCaptains = moreCaptains.sort()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sortedCaptains.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)

        let captainsName = sortedCaptains[indexPath.row]
        cell.textLabel?.text = "\(captainsName)"
        return cell
    }
}


let testDataSource = TestDataSource()
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), style: .Plain)
tableView.dataSource = testDataSource
tableView.reloadData()



