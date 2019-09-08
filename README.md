# kirie
Cross-language application composition standard


## As Library
It's a library in the same sense as "set of tools" you can use in your app.
Instead of "these tools will use YOUR app" which is common for frameworks.
* you can use any piece independently with only strictly necessary dependencies
* you can create partial derivative works


## As Framework
Don't get me wrong: linux kernel IS **framework** also
* all new pieces of code must follow set of conventions and standards
* everything has the same fixed API
* adding new code initially is easy but becomes increasingly difficults with
  number of standards to follow
* …but without these standards you will inevitably create them yourself…


## As Buildsystem
Lets face reality: actually both "dast" and even "kirie" IS **buildsystem**
* track dependencies and draw dependency graph
* track fixed datastreams through topologies
* managing artifacts on all steps: rebuilding, cleaning, caching…
* incremental update of immediate system when changing code inside any script



# TBD

IDEA: separate setting env vars for SUITE from pure functions of stdin/cmdline args
  !!! "dast" is based on "kirie", but "kirie" itself must be based on "dast"

TODO
    TRY to combine "config" with "env"
    TRY to replace "wiw/config" by "kirie/config" with overriden fallbacks
