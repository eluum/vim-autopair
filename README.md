# vim-autopair
A very simple vim plugin for autocompleting the paired characters (), [], {}, '', and ""

Press tab after any autocomplete pair to cancel and only write the single character. 

Pressing ; after any pair will skip to the end of the line and place a semicolon. Pressing 
{ after ( will skip to the end of the parentheses and add a bracket pair.

Pressing any pair key in visual mode will surround the selected text with that key.
(For double quotes, press space as a leader key, since " is already used to specify registers)
