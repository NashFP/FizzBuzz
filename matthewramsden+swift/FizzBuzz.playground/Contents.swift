// Functional Swift: Fizz Buzz

precedencegroup ForwardApplication { associativity: left }
infix operator |>: ForwardApplication
func |> <A, B>(left: A, right: (A) -> B) -> B {
    return right(left)
}

struct FB {
    let fizzBuzz = { $0 % 3 == 0 && $0 % 5 == 0 }
    let fizz = { $0 % 3 == 0 }
    let buzz = { $0 % 5 == 0 }
}

func testFizzBuzz(number: Int) -> String {
    if number |> FB.init().fizzBuzz {
        return "Fizz Buzz"
    } else if number |> FB.init().fizz {
        return "Fizz"
    } else if number |> FB.init().buzz {
        return "Buzz"
    } else {
        return String(number)
    }
}

assert(testFizzBuzz(number: 1) == "1", "testFizzBuzz did not pass")
assert(testFizzBuzz(number: 3) == "Fizz", "testFizzBuzz did not pass")
assert(testFizzBuzz(number: 5) == "Buzz", "testFizzBuzz did not pass!")
assert(testFizzBuzz(number: 15) == "Fizz Buzz", "testFizzBuzz did not pass")

Array(1...20).forEach {
    print(testFizzBuzz(number: $0))
}

