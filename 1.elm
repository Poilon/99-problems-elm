module Main exposing (..)

import Html
import List
import Maybe


last : List a -> Maybe a
last xs =
    -- your implementation goes here
    List.head (List.reverse xs)


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed "
                    ++ (toString x)
                    ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ last (listrange 1 4) == Just 4
            , last [ 1 ] == Just 1
            , last [] == Nothing
            , last [ 'a', 'b', 'c' ] == Just 'c'
            ]


listrange : Int -> Int -> List Int
listrange start end =
    List.range start end
