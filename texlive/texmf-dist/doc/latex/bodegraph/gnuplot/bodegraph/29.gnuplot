set table "gnuplot/bodegraph/29.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-2:2] log10(10**t),20*log10(abs((3*4/6)/sqrt(1+((70/6)*10**t)**2)))-20*log10(abs(1/sqrt(1+((5/4)*10**t)**2)))
