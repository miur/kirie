<!--
SPDX-FileCopyrightText: 2019 Dmytro Kolomoiets <amerlyq@gmail.com> and contributors

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# kirie

Cross-language application composition standard


## As Library

It's a library in the same sense as "set of tools" you can use in your app.
Instead of "these tools will use YOUR app" which is common for frameworks.

* you can use any piece independently with only strictly necessary dependencies
* you can create partial derivative works


## As Framework

Don't get me wrong: linux kernel is **framework** also

* all new pieces of code must follow set of conventions and standards
* everything has the same fixed API
* adding new code initially is easy but becomes increasingly difficults with
  number of standards to follow
* …but without these standards you will inevitably create them yourself…


## As Buildsystem

Lets face reality: actually both "dast" and even "kirie" is **buildsystem**

* track dependencies and draw dependency graph
* track fixed datastreams through topologies
* managing artifacts on all steps: rebuilding, cleaning, caching…
* incremental update of immediate system when changing code inside any script


# COPYING

* You are allowed to repurpose the source code files under Apache-2.0 license.
* Documentation is governed by copyleft CC-BY-SA-4.0 which results in
  this software as combined whole required to be distributed also share-alike.
* As a consequence, to satisfy incompatible relicensing terms (e.g. proprietary)
  you must remove documentation and keep only files with explicit permissive licenses.
* This project strives to be fully compliant with REUSE v3.0+ Specification,
  therefore all files are expected to contain explicit SPDX v2.1+ annotations
  to help differentiating terms of reuse of each file.


# TBD

IDEA: separate setting env vars for SUITE from pure functions of stdin/cmdline args

* !!! "dast" is based on "kirie", but "kirie" itself must be based on "dast"


TODO

* TRY to combine "config" with "env"
* TRY to replace "wiw/config" by "kirie/config" with overriden fallbacks
