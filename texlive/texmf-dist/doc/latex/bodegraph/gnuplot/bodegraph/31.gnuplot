set table "gnuplot/bodegraph/31.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-2:2] log10(10**t),-180/3.1415957*atan((70/6)*10**t)--180/3.1415957*atan((5/4)*10**t)
