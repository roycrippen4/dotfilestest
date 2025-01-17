; extends

(type_arguments
  (type_identifier) @type.argument)

(type_arguments
  (primitive_type) @type.argument)

(type_arguments
  (generic_type _ @type.argument))

(attribute_item 
  [
    "["
    "]"
  ] @punctuation.special)

(inner_attribute_item 
  [
    "["
    "]"
  ] @punctuation.special)

(attribute
  arguments: (_ ["(" ")"] @function.macro))

(use_declaration 
  argument: (_ "::" @punctuation.special))
