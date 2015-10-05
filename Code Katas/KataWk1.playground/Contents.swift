// Question 1 - Multiples of 3 and 5

// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

var sum = 0
for i in 1..<1000 {
    if i % 3 == 0 || i % 5 == 0 {
        sum += i
    }
}
sum

// Question 2 - Largest Palindrome Product

// A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

var i = 999, int1 = 999, int2 = 999, product = 0

// multiply int1 * int2, decrementing int2 each loop

// when product == product.reverse (or sames), stop loop, return product

while i > 0 {
    product = int1 * int2
    if product == reverseInt(product)
    {
        print(product)
    }
    else
    {
        i--
        int2--
    }
}

