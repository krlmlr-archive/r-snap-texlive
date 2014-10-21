set table "gnuplot/bodegraph/17.table"; set format "%.5f"
set samples 101; set parametric; plot [t=-1:1.7] log10(10**t),20*log10(abs(6/sqrt((1-(10**t/10)**2)**2+(2*0.3*(10**t/10))**2)))
