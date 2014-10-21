set table "gnuplot/bodegraph/53.table"; set format "%.5f"
set samples 100; set parametric; plot [t=-1.5:1.5] log10(10**t),(t<log10(1/(0.5))?20*log10(8):+20*log10(8/(0.5))-20*log10(10**t))+20*log10(abs(1/(10**t)))
