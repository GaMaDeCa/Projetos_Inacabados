{- Just String handling in Haskell(Tested in play.haskell.org) -}
import Data.Char (toUpper, toLower)

main :: IO ()
main = do
  let ourString = "Hello World"
  let lenStr = show $ length ourString
  let isPali = show $ isPalindrome ourString
  print $ "String Length: " ++ lenStr 
  print $ "Is Palindrome: " ++ isPali
  print $ "Capitalize: " ++ capitalize ourString
  print $ "Upper Case: " ++ toUpperCase ourString
  print $ "Lower Case: " ++ toLowerCase ourString
  print $ "Reverse String: " ++ reverseString ourString
  print $ "Slice 2,5: " ++ slice ourString 2 5
--  print $ "Step 2: " ++ step ourString 2 TODO

-- There's a built-in function that handles this, its called just "reverse"(reverse string)
-- Use: reverseString "Hello"
reverseString :: String -> String
reverseString [] = [] -- When body gets null(because the head(h) got cut XD everytime the function executes).
reverseString (h:body) = reverseString body ++ [h]
-- Ok, so let's get to understand what it actually do,
-- Firstly, all functions need to be declared first, then builded later,
-- So the first one specifies it will takes a String as input and output a String,
-- The second one is a "case", when the argument gets null(the string reachs the end, this means the body is null),
-- The third one is a bit tricky, but it basically says:
--    Split the string "head"(h) and "body" with :
--    Then recursively use the reverseString function ONLY ON THE body ARGUMENT
--    The ++ sums the head([h]) with the "reverseString body" output recursively
--    When the string reachs to end, the function with [] arguments will return a empty list too []
-- So what can we conclude? Here we treat Strings as lists too(may work with lists)

isPalindrome :: String -> Bool
isPalindrome s = s == reverse s

capitalizeFirst :: String -> String
capitalizeFirst [] = []
capitalizeFirst (firstChar:rest) = toUpper firstChar : map toLower rest

capital :: [String] -> String
capital [] = []
capital (firstWord:nextWord) = capitalizeFirst firstWord ++ " " ++ capital nextWord

capitalize :: String -> String
capitalize [] = []
capitalize s = capital (words s)

toUpperCase :: String -> String
toUpperCase s = map toUpper s


toLowerCase :: String -> String
toLowerCase s = map toLower s

slice :: String -> Int -> Int -> String
slice str start end = take (end-2) (drop start str)