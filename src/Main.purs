module Main where

import Control.Monad.Eff
import Data.Foreign.EasyFFI
import Debug.Trace
import DOM
import Data.Array
import Data.Foldable

-- Example of a simple object without a constructor
type CoordType = { x::Number, y::Number }

-- Data type with a constructor
-- generates an object with a constructor
-- function Coord(value0) { this.value = value0; }
-- Coord.create = function(value0) { return new Coord(value0); }
data Coord = Coord { x::Number, y::Number }

-- The dot operator is not used for functional composition
-- A dot is used as a field accessor for records/objects
showCoordinate :: CoordType -> String
showCoordinate coord = show(coord.x) ++ "," ++ show(coord.y)

-- Standard way of using purescript-foreign to deal with javascript
foreign import replaceTextStandard
"function replaceTextStandard(id) {\
\   return function(line) {\
\       var text = document.getElementById(id);\
\       text.innerHTML = line; \
\   };\
\}" :: forall eff. String -> String -> Eff (dom :: DOM | eff) Unit

-- Using purescript-easy-ffi
replaceTextEasy :: forall eff. String -> String -> Eff ( dom :: DOM | eff ) Unit
replaceTextEasy = unsafeForeignProcedure ["id", "line", ""] "var text = document.getElementById(id); text.innerHTML = line;"

-- Folds a list of numbers to a string
strFold :: [Number] -> String
strFold lis = foldl (\acc n -> acc ++ show n) "" lis

main :: forall eff. Eff (dom :: DOM | eff) Unit
main = do
    replaceTextStandard "title_1" "Hello sailor"
    replaceTextEasy     "title_2" $ strFold [1,2,3,4,5]

