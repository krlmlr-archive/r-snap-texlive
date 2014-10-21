set table "gnuplot/bodegraph/58.table"; set format "%.5f"
set samples 100; set parametric; plot [t=-1:4] log10(10**t),20*log10(abs(5/sqrt((1-(10**t/15)**2)**2+(2*0.3*(10**t/15))**2)))-20*log10(abs(1/sqrt(1+(0.01*10**t)**2)))
