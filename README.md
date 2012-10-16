utilities
=========

This repo is for useful code and examples that I made to possibly use later.

**Compiling and Running Instructions**
Parallel Stuff

	ghc -O2 --make code.hs -threaded -rtsopts
	./code +RTS -N2

2 is number of cores used
Note that in versions of GHC prior to GHC 7, you can leave off the -rtsopts flag
