// tuples

let tipAndTotal = (4.00, 25.19)
tipAndTotal.0
tipAndTotal.1

let (theTipAmt, theTotal) = tipAndTotal
theTipAmt
theTotal

let tipAndTotalNamed = (tipAmt: 5.00, total: 30.25)
tipAndTotalNamed.tipAmt

let total = 21.09
let taxPercent = 0.06
let subTotal = total / (taxPercent + 1)

func calcTipWithTipPercent(tipPercent: Double) -> (tipAmount: Double, finalTotal: Double)
{
    let tipAmount = subTotal * tipPercent
    let finalTotal = total + tipAmount
    return (tipAmount, finalTotal)
}

let totalWithTip = calcTipWithTipPercent(0.20)


class TipCalculator
{
    let total: Double
    let taxPct: Double
    let subTotal: Double
    
    init(argTotal: Double, argTaxPct: Double)
    {
        self.total = argTotal
        self.taxPct = argTaxPct
        self.subTotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double
    {
        return subTotal * tipPct
    }
    
    func printPossibleTips()
    {
        print("15%: $\(calcTipWithTipPct(0.15))")
        print("20%: $\(calcTipWithTipPct(0.20))")
        print("25%: $\(calcTipWithTipPct(0.25))")
    }
    
    func returnPossibleTips() -> [Int: Double]
    {
        let possibleTips = [0.15, 0.18, 0.20]
        var rValue = [Int: Double]()
        for possibleTip in possibleTips
        {
            let intPct = Int(possibleTip*100)
            rValue[intPct] = calcTipWithTipPct(possibleTip)
        }
        return rValue
    }
}

let tipCalc = TipCalculator(argTotal: 45.75, argTaxPct: 0.06)
let tip20 = tipCalc.calcTipWithTipPct(0.2)
tipCalc.subTotal
tipCalc.total
tip20

tipCalc.printPossibleTips()
let tipDictionary = tipCalc.returnPossibleTips()
tipDictionary[20]

class BodyPart
{
    
}

class Limb : BodyPart
{
    
}

class Leg : Limb 
{
    
}
