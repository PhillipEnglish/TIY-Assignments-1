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
