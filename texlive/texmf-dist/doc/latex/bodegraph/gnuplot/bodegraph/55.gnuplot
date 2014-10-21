set table "gnuplot/bodegraph/55.table"; set format "%.5f"
set samples 100; set parametric; plot [t=-2:2] log10(10**t),(t<log10(1/(0.5))? 0:-90)+-90
