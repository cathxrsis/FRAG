module Main where

import Data.Lens.Lens
import Prelude
import Text.Parsing.Parser
import Text.Parsing.Parser.Combinators
import Text.Parsing.Parser.String

import Data.Either (Either)
import Data.Lens.Record (prop)
import Data.List (List)
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "🍝"

-- Whether a behaviour is event based, phasic or ubiquitous
data Temporality = EVENT | PHASE | UBIQUITY

-- Numerical predicates, greater than etc.
data Comparitor = GT | GTE | LT | LTE | E

-- Physical Units (probably a better way of constructing)
data Dim = METRES | KG | SECONDS | AMPS | MOLS

-- Physical units of a value as two lists 
type Units = Tuple (List Dim) (List Dim)

-- A numerical value with physical units
type NumVal = {val :: Number, unit :: Units}

_val :: forall a r. Lens' { val :: a | r } a
_val = prop (SProxy :: SProxy "val")

_unit :: forall a r. Lens' {unit :: a | r } a 
_unit = prop (SProxy :: SProxy "unit") 

-- A value with either an ID or a numerical representation (Vectors/matrices should be possible)
type Value = Either NumVal String

type EventCondition =
  { variable :: GrammarFragment
  , comparison :: Comparitor
  , value :: Value
  }

_variable :: forall a r. Lens' {variable :: a | r } a
_variable = prop (SProxy :: SProxy "variable")

_comparison :: forall a r. Lens' {comparison :: a | r } a
_comparison = prop (SProxy :: SProxy "comparison")

_value :: forall a r. Lens' {value :: a | r} a
_value = prop (SProxy :: SProxy "value")

-- The severity of the statement. 
data Severity = MUST | SHALL | SHOULD | MAY | CAN | WILL

data FocusType = MEASURABLE | FUNCTION

data WordType = NOUN | VERB | ADJECTIVE | ADVERB | PREPOSITION | ARTICLE

type FragPreconditions = 
  { temporality :: Temporality
  , conditions :: String
  }

type Word = Tuple String WordType

type GrammarFragment = List Word

type FragStatement = 
  { preconditions :: FragPreconditions
  , object         :: String
  , focusType     :: FocusType
  }

-- Failure Propagation
-- When 

-- Parsers

type FragParser = Parser String FragStatement

--parseConditions :: FragParser