set table "gnuplot/bodegraph/19.table"; set format "%.5f"
set samples 50; set parametric; plot [t=1:2] log10(10**t),(t<log10(10)? 0:-180)
