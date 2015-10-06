class BodyPart
{
    let latinName: String
    let exists: Bool
    let healthy: Bool
    
    
    init(argLatinName: String, argExists: Bool, argHealthy: Bool){
        self.latinName = argLatinName
        self.exists = argExists
        self.healthy = argHealthy
    }
    
    func repair(latinName: String, doctor: String, technique: String)
    {
        
    }
    
    func replace(latinName: String, exists: Bool, donor: String)
    {
        
    }
    
    func remove(latinName: String, patientApproval: Bool, isEmergency: Bool)
    {
        
    }
}

class Head : BodyPart
{
    let hairColor: String
    let hairStyle: String
    let hasNose: Bool
    
    
    init(argHairColor: String, argHairStyle: String, argHasNose: Bool){
        self.hairColor = argHairColor
        self.hairStyle = argHairStyle
        self.hasNose = argHasNose
    }
    
    func changeHairColor(currentColor: String, newColor: String)
    {
        
    }
    
    func changeHairStyle(currentStyle: String, newStyle: String, cost: Double)
    {
        
    }
    
    func blowNose(hasTissue: Bool, hasNose: Bool)
    {
        
    }
}

class Hand : BodyPart
{
    let length: Double
    let width: Double
    let fingerCount: Int
    
    
    init(argLength: Double, argWidth: Double, argFingerCount: Int){
        self.length = argLength
        self.width = argWidth
        self.fingerCount = argFingerCount
    }
    
    func makeFist(fingerCount: Int, isAngry: Bool)
    {
        
    }
    
    func openHand(fingerCount: Int, isHoldingSomething: Bool)
    {
        
    }
    
    func waveHand(isGreeting: Bool)
    {
        
    }
}

class Foot : BodyPart
{
    let shoeSize: Double
    let shoeWidth: String
    let toeCount: Bool
    
    
    init(argShoeSize: Double, argShoeWidth: String, argToeCount: Bool){
        self.shoeSize = argShoeSize
        self.shoeWidth = argShoeWidth
        self.toeCount = argToeCount
    }
    
    func flexToes(footExists: Bool)
    {
        
    }
    
    func fixFoot(footExists: Bool, footIsHealthy: Bool)
    {
        // utilize super.repair()
    }
    
    func wiggleToes(isHealthy: Bool)
    {
        
    }
}

class Finger : BodyPart
{
    let hasNail: Bool
    let nailColor: String
    let isDoubleJointed: Bool
    
    
    init(argHasNail: Bool, argNailColor: String, argIsDoubleJointed: Bool){
        self.hasNail = argHasNail
        self.nailColor = argNailColor
        self.isDoubleJointed = argIsDoubleJointed
    }
    
    func paintNail(nailExists: Bool, hasNail: Bool, colorSelection: String)
    {
        
    }
    
    func poke(fingerExists: Bool, fingerIsHealthy: Bool, victim: String)
    {
        
    }
    
    func scratch(hasNail: Bool, target: String)
    {
        
    }
}

class Toe : BodyPart
{
    let littlePiggieDestination: String
    let isBlistered: Bool
    let nickname: String
    
    init(argDestination: String, argIsBlistered: Bool, argNickname: String){
        self.littlePiggieDestination = argDestination
        self.isBlistered = argIsBlistered
        self.nickname = argNickname
    }
    
    func goHome(whichPiggy: String, whereTo: String)
    {
        
    }
    
    func healToe(isBlistered: Bool, nickname: String)
    {
        
    }
    
    func fitTightShooes(toeExists: Bool)
    {
        // super.remove(toe)
    }
}

class Limb : BodyPart
{
    var isJointHealthy: Bool
    var rightOrLeft: String
    var needsBrace: Bool
    
    
    init(argIsJointHealthy: Bool, argRightOrLeft: String, argNeedsBrace: Bool){
        self.isJointHealthy = argIsJointHealthy
        self.rightOrLeft = argRightOrLeft
        self.needsBrace = argNeedsBrace
    }
    
    func bend(healthyJoint: Bool)
    {
        
    }
    
    func straighten(whichSide: String)
    {
        
    }
    
    func wearBrace(latinName: String, needsBrace: Bool)
    {
        
    }
}

class Leg : Limb
{
    let isKneeIntact: Bool
    let numOfSurgeries: Int
    let isHairy: Bool
    
    
    init(argKneeIntact: Bool, argNumOfSurgeries: Int, argIsHairy: Bool){
        self.isKneeIntact = argKneeIntact
        self.numOfSurgeries = argNumOfSurgeries
        self.isHairy = argIsHairy
    }
    
    func shave(wearingBrace: Bool, isStraight: Bool, isHairy: Bool)
    {
        // utilizes super.straighten(<#T##whichSide: String##String#>)
    }
    
    func replace(latinName: String, healthyJoint: Bool, doctor: String)
    {
        // overides superclass func
    }
    
    func bend(healthyJoint: Bool, isIntact: Bool)
    {
        // overloads Limb bend func
    }
}

class Arm : Limb
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
    func liftWeights(isStrong: Bool, isHealthy: Bool)
    {
        
    }
    
    func showGuns(isStrong: Bool)
    {
        
    }
    
    func hug(armExists: Bool)
    {
        
    }
}

class Organ : BodyPart
{
    let isOriginal: Bool = true
    let availableToDonate: Bool = true
    let isViable: Bool = true
    
    func recieveDonation(isViable: Bool, latinName: String)
    {
        // utilize super.replace()
    }
    
    func giveDonation(availableToDonate: Bool, isViable: Bool, recipient: String, doctor: String)
    {
        // utilize remove method
    }
    
    func test(organExists: Bool, doctor: String)
    {
        
    }
}

class Heart : Organ
{
    let beatsPerMin: Int = 0
    let hasMurmur: Bool = false
    let hasPalpitations: Bool = false
    
    func restart(exists: Bool, isViable: Bool, hasShockerThingie: Bool)
    {
        
    }
    
    func repair(latinName: String, doctor: String, technique: String, isViable: Bool)
    {
        // overloads super method
    }
    
    func breakHeart(exists: Bool, nemesis: String)
    {
        
    }
}

class Liver : Organ
{
    let numOfLobes: Int = 4
    let color: String = ""
    let feels: String = ""
    
    func partialDonation(latinName: String, patientApproval: Bool, isEmergency: Bool)
    {
        
    }
    
    func abuse(numOfBeers: Int)
    {
        
    }
    
    func rest(status: String, timeToRest: Int)
    {
        
    }
}

class Kidney : Organ
{
    let numOfKidneys: Int = 2
    let healthOfKid1: String = "fair"
    let healthOfKid2: String = "excellent"
    
    func donateOneKidney(whichKidney: Int, viable: Bool)
    {
        // isViable()
        // remove()
    }
    
    func insertDonatedKidney(patientHealth: String, doctor: String)
    {
        
    }
    
    func checkSymptoms(feelsPain: Bool, discomfortLevel: Int)
    {
        
    }
}

class Skin : Organ
{
    let hasTattoos: Bool = false
    let skinType: String = ""
    let isHairy: Bool = false
    
    func removeTattoos(isHairy: Bool, isHealthy: Bool)
    {
        
    }
    
    func wash(skinExists: Bool, skinDirty: Bool, skinType: String)
    {
        
    }
    
    func wax(isHairy: Bool, waxType: String)
    {
        
    }
}

class Lungs : Organ
{
    let numOfLungs: Int = 2
    let lungColor: String = ""
    let coughing: Bool = false
    
    func testLungs(doctor: String, testType: String, isCoughing: Bool)
    {
        
    }
    
    func treatForCough(isCoughing: Bool, medicine: String)
    {
        
    }
    
    func aspirate(lungExists: Bool, doctor: String)
    {
        
    }
}

class Stomach : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    func a()
    {
        
    }
    
    func b()
    {
        
    }
    
    func c()
    {
        
    }
}

class Gallbladder : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    func a()
    {
        
    }
    
    func b()
    {
        
    }
    
    func c()
    {
        
    }
}

class Appendix : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    func a()
    {
        
    }
    
    func b()
    {
        
    }
    
    func c()
    {
        
    }
}

class Pancreas : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    func a()
    {
        
    }
    
    func b()
    {
        
    }
    
    func c()
    {
        
    }
}

class Bladder : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    func a()
    {
        
    }
    
    func b()
    {
        
    }
    
    func c()
    {
        
    }
}
