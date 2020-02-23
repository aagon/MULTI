#!/bin/sh

# Taux de miss (instructions et données) et CPI cumulatifs, toute la période, ticks de 1000 cycles.
gnuplot -p -e 'set title "Taux de miss et CPI cumulatifs, tout le calcul" ; set xlabel "Index du cycle"; set ylabel "Taux de miss"; set y2label "CPI"; set xrange [:74500] ; set yrange [0:] ; set y2range [1:];  set y2tics 0, 0.5; set ytics nomirror; plot "./complet" using 1:2 title "Instructions (gauche)" axis x1y1, "./complet" using 1:3 title "Données (gauche)" axis x1y1, "./complet" using 1:4 title "CPI (droite)" axis x1y2'

# Taux de miss (instructions et données) et CPI cumulatifs, 1000 premiers cycles, ticks de 100 cycles.

gnuplot -p -e 'set title "Taux de miss et CPI cumulatifs, 1000 premiers cycles" ; set xlabel "Index du cycle"; set ylabel "Taux de miss"; set y2label "CPI"; set xrange [:1000] ; set yrange [0:] ; set y2range [1:];  set y2tics 0, 0.5; set ytics nomirror; plot "./debut" using 1:2 title "Instructions (gauche)" axis x1y1, "./debut" using 1:3 title "Données (gauche)" axis x1y1, "./debut" using 1:4 title "CPI (droite)" axis x1y2'

# Durée en fonction de la largeur de la ligne de cache
gnuplot -p -e 'set title "Influence de la largeur de la ligne de cache" ; set xtics ("" 0, "256:1" 1, "128:2" 2, "64:4" 3, "32:8" 4, "16:16" 5, "8:32" 6, "" 7); set xrange [0:7]; set xlabel "Agencement [Nb lignes:largeur ligne]";  set ylabel "Durée en cycles" ; plot "./largeur" using 3:4 title "" with linespoints '

# Combiner deux pdf en un *en une page*
pdfjam complet.pdf debut.pdf --nup 1x2 --outfile completdebut.pdf

