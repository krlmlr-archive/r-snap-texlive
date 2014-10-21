set table "gnuplot/bodegraph/54.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-1.5:1.5] log10(10**t),20*log10(abs(8/sqrt(1+(0.5*10**t)**2)))+20*log10(abs(1/(10**t)))
