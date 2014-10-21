set table "gnuplot/bodegraph/38.table"; set format "%.5f"
set samples 50; set parametric; plot [t=0:3] log10(10**t),(t<log10(1/0.08)?20*log10(2):+20*log10(2*0.08)+20*log10(10**t))
