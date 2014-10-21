#!/bin/bash

fonts=(drm10 drmsl10 drmit10 drmui10 drmsc10 drmtc10 drml10 \
drmb10 drmbx10 drmmi10 drmsy10 drmomx10 drmsym10);
encs=(T1 T1 T1 T1 T1 T1 T1 T1 T1 OML OMS OMX TS1);
names=(drm drm drm drm drm drm drm drm drm drm drm drm drmsym);
weights=(m m m m m m l b bx m m m m);
shapes=(n sl it ui sc tc n n n n n n n);

j=0;
for i in "${fonts[@]}"; do
nfssfontin=$(cat <<ENDFONTIN
${fonts[j]}
\table\bye
${encs[j]}
${names[j]}
${weights[j]}
${shapes[j]}
10
\table\bye
ENDFONTIN
)
#echo "$nfssfontin";
echo "$nfssfontin" | pdflatex nfssfont;
if [ $j == 0 ]; then
	mv nfssfont.pdf tables_0.pdf;
else
#	echo "cat nfssfont.pdf to tables_$((j-1)), output tables_$j.pdf";
	pdftk A=nfssfont.pdf B=tables_$((j-1)).pdf cat B A output tables_$j.pdf;
fi;
let "j++";
done
mv tables_12.pdf drm_font_tables.pdf;
rm tables_*.pdf;
