set table "gnuplot/bodegraph/18.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-1:0.999] log10(10**t),(t<log10(10)? 0:-180)
