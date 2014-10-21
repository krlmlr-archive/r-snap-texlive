set table "gnuplot/bodegraph/16.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-1:1.7] log10(10**t),+(t<log10(10)?20*log10(6):+20*log10(6)+40*log10(10)-40*log10(10**t))
