# ED-Heisenberg
An exact diagonalization practice for spin-1/2 Heisenberg chain.

--------------v0.1------------------

chain.m----------main program

numup.m----------count the number of 1 in a binary number

search.m---------bi-search

genmag.m---------generate basis via magnetization conversation


You need to change the size L in chain.m.

Next: the second blocking via translation symmetry.



--------------v0.2------------------

The ground state actually exists only in the subspace of zero magnetization. Thus it suffices to play in this subspace. Related files contains:

sz0.m----------main program for zero magnetization

numup.m----------count the number of 1 in a binary number

searchin.m-----------modified bi-search code

renyi.m----------compute Renyi entanglement entropy of a subsystem.


The length of the chain is N. The program is now computing Renyi entanglement entropy.

Next: several sysmetries.
