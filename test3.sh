#!/bin/sh

# Pour exécuter ce test, en supposant que votre exécutable soit
# nommé "tp" :
#	time PROG=./tp sh test3.sh
# et vous pouvez comaprer le résultat et le temps avec ce qui est
# attendu plus bas.

PROG=${PROG:-./a.out}

# test aux limites : buffer d'une seule case
$PROG 10 1   1 1 2 2
exit

# Durée : 2 secondes
# Résultat attendu (pas forcément dans l'ordre) : 2 x 1, 2 x 2, 10 x -1
Thread 8 lu 1
Thread 0 lu 1
Thread 9 lu 2
Thread 3 lu 2
Thread 4 lu -1
Thread 5 lu -1
Thread 6 lu -1
Thread 7 lu -1
Thread 2 lu -1
Thread 1 lu -1
Thread 0 lu -1
Thread 8 lu -1
Thread 9 lu -1
Thread 3 lu -1
**********
fin
