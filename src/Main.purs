module Main where

import Prelude
import Text.Parsing.Parser

import Data.Either (Either)
import Data.List (List)
import Data.Tuple (Tuple)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "🍝"

--FragStatement   ::= Conditions Subject Operator Relationship Measures
--
--Conditions      ::= ('When' EventCondition ';')? ('While' StateConditions ';')?
--
--EventCondition  ::= Variable 'becomes' ( Comparator )? Value
--
--StateConditions ::= (Variable 'is' ( Comparator )* Value ('AND')? )*
--
--Subject         ::= NounPhrase
--
--Operator        ::= ('must' | 'shall' | 'should' | 'may' | 'can' | 'will' |)
--
--Relationship    ::= ('have' | 'produce' | 'receive' | 'set') Variable PrepositionalActors
--
--PrepositionalActors ::= (Preposition Actor)*
--
--Actor           ::= NounPhrase
--
--Measures        ::= 'with' ('a(n)' Measurable 'of' Measure (AND)?)+
--
--Measurable      ::= ('value' | 'rate' | 'reaction' | 'range' | OtherMeasurable)
--
--Measure         ::= Comparator Value ('AND' Comparator Value)?
--
--Value           ::= String | Num (Units)?
--
--Variable        ::= NounPhrase
--
--Comparator      ::= '>' | '<' | '>=' | '<='

data Temporality = EVENT | PHASE | UBIQUITY

data Comparitor = GT | GTE | LT | LTE | E

data Dim = METRES | KG | SECONDS | AMPS | MOLS

type Units = Tuple (List Dim) (List Dim)

type NumVal = {val :: Number, unit :: Units}

type Value = Either NumVal String

type EventCondition =
  { variable :: GrammarFragment
  , comparison :: Comparitor
  , value :: Value
  }

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

parseConditions :: FragParser
parseConditions  = do
  