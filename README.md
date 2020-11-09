# Scheme-Translater
My school Scheme Translater Project

**Modules**

core: *required by other modules*

- error-manager.rkt *Provides functanallity to display errors on a dialog-window*

extended: *require modules from ./core*

- extended-math.rkt *Provides factorial recursion and binco*
requires: error-manager.rkt

standalone: *no dependencies*

##**Useing the Translator**
You can run the "Interface.rkt" in DrRacket or use one of the Builds (avaible for Linux and Windows)

Currently the Translator is only able to translate one word at a time.
The input is **casesensetive**.
He is translating while you are typing.

**Exsample**: Hello --> Hallo


##**Programm Structure**
Interface.rkt: The complete GUI is build in the Interface.rkt. It is split into multiple containers.


- (translate input-text) is the connection function between the GUI and the translation-algorithem provided by the Dictonary.rkt. 

Firstly it erases the text in the input-text-field.

Secondly it displays the

- (translate-word 

input-text *provided by the input-text-field text*

dict *which is also provided by the Dictonary.rkt and is the actual dictonary of words used to translate between the laguages*

lang *which is a index provided by the translate-choice selection*

)


Dictonary.rkt: Contains the Dictionary and all the functionallity needed to brows it and get the translation.


- (dict) is the list which includes all used vocabulary. Currently it provides **Deutsch and Egnlisch**


- (search

s-word *The word (as a "string") to search for*

dictonary *the dictonary to search in*

) *it returns the row containing all avaibl translation in all availt languages*


- (translate-word

s-word

dictonary

lang *the language to translate to given as an index beginning at 0.*

) *returns a single "string" which*

    1: contains the translation or

    2: contains "..." if there is no avaible translation

- (get-word s-word dictonary lang) *Used by (translate-word) to return the single "string"*
