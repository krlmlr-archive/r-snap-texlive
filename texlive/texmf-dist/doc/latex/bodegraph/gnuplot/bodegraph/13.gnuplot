set table "gnuplot/bodegraph/13.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-2:2] log10(10**t),20*log10(abs(6/sqrt(1+(0.3*10**t)**2)))
