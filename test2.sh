#!/bin/sh

# Pour exécuter ce test, en supposant que votre exécutable soit
# nommé "tp" :
#	time PROG=./tp sh test2.sh
# et vous pouvez comaprer le résultat et le temps avec ce qui est
# attendu plus bas.

PROG=${PROG:-./a.out}

# contention sur le buffer entre les 5 threads
$PROG 5 3   1 1 2
exit

# Durée : 2 secondes
# Résultat attendu (pas forcément dans l'ordre) : 2 x 1, 1 x 2, 5 x -1
Thread 4 lu 1
Thread 0 lu 1
Thread 1 lu 2
Thread 2 lu -1
Thread 3 lu -1
Thread 4 lu -1
Thread 0 lu -1
Thread 1 lu -1
*****
fin
