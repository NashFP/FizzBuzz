module Main

mapToFizzBuzz : Nat -> String
mapToFizzBuzz n = if isFizz n && isBuzz n then "FizzBuzz" else
                  if isFizz n then "Fizz" else
                  if isBuzz n then "Buzz" else show n
          where isFizz n      = modNat n 3  == 0
                isBuzz n      = modNat n 5  == 0

reduceFizzBuzz : String -> Nat -> String
reduceFizzBuzz s n = s ++ mapToFizzBuzz n ++ "\n"

main : IO ()
main = do
  putStrLn $ foldl reduceFizzBuzz "" [1..100]
