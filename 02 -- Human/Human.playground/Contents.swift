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
    
    func repair()
    {
        
    }
    
    func replace()
    {
        
    }
    
    func remove()
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
    
    func changeHairColor()
    {
        
    }
    
    func changeHairStyle()
    {
        
    }
    
    func blowNose()
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
    
    func makeFist()
    {
        
    }
    
    func openHand()
    {
        
    }
    
    func waveHand()
    {
        
    }
}

class Foot : BodyPart
{
    let shoeSize: Double
    let shoeWidth: String
    let isFlat: Bool
    
    
    init(argShoeSize: Double, argShoeWidth: String, argIsFlat: Bool){
        self.shoeSize = argShoeSize
        self.shoeWidth = argShoeWidth
        self.isFlat = argIsFlat
    }
    
    func flexToes()
    {
        
    }
    
    func curlToes()
    {
        
    }
    
    func wiggleToes()
    {
        
    }
}

class Finger : BodyPart
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Toe : BodyPart
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Knee : BodyPart
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Leg : Limb
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Organ : BodyPart
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Heart : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Liver : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Kidney : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Skin : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Lungs : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Stomach : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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

class Eye : Organ
{
    let x: String
    let y: Bool
    let z: String
    
    
    init(argX: String, argY: Bool, argZ: String){
        self.x = argX
        self.y = argY
        self.z = argZ
    }
    
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
