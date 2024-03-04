#!/bin/sh

# Pour exécuter ce test, en supposant que votre exécutable soit
# nommé "tp" :
#	time PROG=./tp sh test1.sh
# et vous pouvez comaprer le résultat et le temps avec ce qui est
# attendu plus bas.

PROG=${PROG:-./a.out}

# contention sur le buffer entre les 4 threads
$PROG 4 10   0 0 0 0
exit

# Durée : 0 secondes
# Résultat attendu (pas forcément dans l'ordre) : 4 x 0, 4 x -1
Thread 2 lu 0
Thread 0 lu 0
Thread 1 lu 0
Thread 3 lu 0
Thread 2 lu -1
Thread 0 lu -1
Thread 1 lu -1
Thread 3 lu -1
****
fin
