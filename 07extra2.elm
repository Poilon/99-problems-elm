module Main exposing (..)

import Html exposing (text)
import List


takeWhile : (a -> Bool) -> List a -> List a
takeWhile predicate list =
    -- your implementation here
    case list of
        [] ->
            []

        e :: rest ->
            if predicate e then
                e :: (takeWhile predicate rest)
            else
                []


main : Html.Html msg
main =
    text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all ((==) True)
        [ (takeWhile isOdd [ 1, 2, 1 ] == [ 1 ])
        , (takeWhile isEven [ 1, 2, 1 ] == [])
        , (takeWhile isEven [] == [])
        , (takeWhile isEven [ 2, 4, 100000, 1 ]
            == [ 2
               , 4
               , 100000
               ]
          )
        , (takeWhile (\x -> x < 5) (List.range 1 10)
            == [ 1
               , 2
               , 3
               , 4
               ]
          )
        ]


isEven : Int -> Bool
isEven x =
    x % 2 == 0


isOdd : Int -> Bool
isOdd x =
    x % 2 /= 0
