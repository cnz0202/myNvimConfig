; extends

((style_element
   (raw_text) @injection.content)
 (#set! injection.language "css"))

((script_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (#eq? @_attr "type")
      (quoted_attribute_value
        (attribute_value) @_type
        (#eq? @_type "text/babel"))))
  (raw_text) @injection.content)
  (#set! injection.language "javascript"))

