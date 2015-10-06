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
    
}

let tipCalc = TipCalculator(argTotal: 83.25, argTaxPct: 0.06)
let tip20 = tipCalc.calcTipWithTipPct(0.2)
tipCalc.subTotal
tipCalc.total
tip20


