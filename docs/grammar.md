The FRAG Grammar
================

This document is a quick reference guide to the FRAG. the FRAG comprises two types of sentence--- Statements and Definitions.

FRAG Statements
---------------


![Railroad diagram of a FRAG statement]{diagram/FragStatement.png}

``` EBNF

FragStatement ::= Conditions Subject Operator Relationship Measure

```

A FRAG statement comprises five parts:

Conditions

  : 

### Hint

In the case of human interaction, 

Subject

  : The subject of a FRAG statement is the System of Interest---the object to be designed which the FRAG statement 

Operator

  : This is a keyword that tells you the severity of the FRAG statement.

Relationship

  : This part of the statement defines the relationship that the *subject* has with the *environment*, *peer systems* or *actors* when the conditions are true. This can be a static relationship (often referred to as a *non-functional* requirement.) or an active relationship



### Operator

The operator of a FRAG Statement can take one of six values whose meanings are defined below.

must

  : By contravening this statement, the subject contravenes the laws of physics, laws of the land, applicable standards and cannot therefore fulfil its base goals.

shall

  : By contravening this statement, the subject will not fulfil its base goals and will not bring value to the user/customer/stakeholder.

should

  : By contravening this statement, the subject will 

May

  : By contravening this statement, the subject 

Can

  : Used to denote that this FRAG statement defines a possibility of the subject, such as the production of possible failure modes or the set of possible values of an output.


FRAG Definitions
----------------