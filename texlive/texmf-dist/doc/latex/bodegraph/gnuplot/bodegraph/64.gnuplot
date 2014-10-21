set table "gnuplot/bodegraph/64.table"; set format "%.5f"
set samples 100; set parametric; plot [t=-3:2] -180/3.1415957*atan(3*10**t),20*log10(abs(5/sqrt(1+(3*10**t)**2)))
