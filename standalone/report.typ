#set document(title: "Basic Files")
#set heading(numbering: "1.")

= Overview

This Typst document exercises markup, math, and code.

#let task(status, title) = [
  - #strong(status): #title
]

#task("doing", "Add Typst fixture")

$ total = sum_(i=1)^n task_i $
