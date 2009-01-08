USING: help.markup help.syntax ;
IN: values

ARTICLE: "values" "Global values"
"Usually, dynamically scoped variables are sufficient for holding data which is not literal. But occasionally, for global information that's calculated just once, it's useful to use the word mechanism instead, and set the word to the appropriate value just once. The " { $vocab-link "values" } " vocabulary implements " { $emphasis "values" } ", which abstract over this concept. To create a new word as a value, use the following syntax:"
{ $subsection POSTPONE: VALUE: }
"To get the value, just call the word. The following words manipulate values:"
{ $subsection get-value }
{ $subsection set-value }
{ $subsection POSTPONE: to: }
{ $subsection change-value } ;

ABOUT: "values"

HELP: VALUE:
{ $syntax "VALUE: word" }
{ $values { "word" "a word to be created" } }
{ $description "Creates a value on the given word, initializing it to hold " { $snippet "f" } ". To get the value, just run the word. To set it, use " { $link POSTPONE: to: } "." }
{ $examples
  { $example
    "USING: values math prettyprint ;"
    "VALUE: x"
    "2 2 + to: x"
    "x ."
    "4"
  }
} ;

HELP: get-value
{ $values { "word" "a value word" } { "value" "the contents" } }
{ $description "Gets a value. This should not normally be used, unless the word is not known until runtime." } ;

HELP: set-value
{ $values { "value" "a new value" } { "word" "a value word" } }
{ $description "Sets a value word." } ;

HELP: to:
{ $syntax "... to: value" }
{ $values { "word" "a value word" } }
{ $description "Sets a value word." }
{ $notes
    "Note that"
    { $code "foo to: value" }
    "is just sugar for"
    { $code "foo \\ value set-value" }
} ;

HELP: change-value
{ $values { "word" "a value word" } { "quot" { $quotation "( oldvalue -- newvalue )" } } }
{ $description "Changes the value using the given quotation." } ;
