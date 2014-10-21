set table "gnuplot/bodegraph/32.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-2:2] log10(10**t),0+(t<log10(1/((70/6)))? 0:-90)-(t<log10(1/((5/4)))? 0:-90)
