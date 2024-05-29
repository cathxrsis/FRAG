FRAG: The Functional Requirements Analysis Grammar
===================================================

FRAG is a tool for analysing systems and generating requirements. It was inspired by my jealousy of programmers that enjoy syntax highlighting, linting and autocompletion in their IDEs. Similarly to programming languages, it comprises a grammar and a compiler. The grammar is an evolution of the Easy Approach to Requirements Syntax (EARS) defined by Alistair Maven [(DOI:10.1109/RE.2009.9).]{http://dx.doi.org/10.1109/RE.2009.9}

In summary, FRAG has the following differences from EARS:

- Semantic strength of keywords---*when*, *where* and *while* have different but stronger definitions.

- Removal of reified type information---No *if* keyword; metainfo about requirements is left to the requirements management tool.

- Stronger definition of the grammar to allow for machine parsing.

The definition of the FRAG can be found in [grammar.md](docs/grammar.md).

Features and Roadmap
--------------------

[] Defined Grammar and Cheatsheet
[] Single statement syntax checking
[] Single statement linting
[] Autocompletion
[] Multi-statement consistency checking
[] Multi-statement linting
[] Compilation to Olog or similar language
