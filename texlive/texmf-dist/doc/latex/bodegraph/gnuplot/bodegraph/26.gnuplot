set table "gnuplot/bodegraph/26.table"; set format "%.5f"
set samples 50; set parametric; plot [t=0:3] log10(10**t),-0.08*10**t
