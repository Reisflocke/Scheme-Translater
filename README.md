# Scheme-Translater
My Scheme Translater Project and all it's bonus features

**Modules**

core: *required by other modules*

- error-manager.rkt *Provides functanallity to display errors on a dialog-window*

extended: *require modules from ./core*

- extended-math.rkt *Provides factorial recursion and binco*
requires: error-manager.rkt

standalone: *no dependencies*

collections: *collection of modules, designed to serve a greater porpuse*
