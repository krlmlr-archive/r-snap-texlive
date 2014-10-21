set table "gnuplot/bodegraph/57.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-1:4] log10(10**t),(t<log10(-)?20*log10(5):+20*log10(5)+40*log10(-)-40*log10(10**t))(t<log10(1/(0.01))?20*log10(1):+20*log10(1/(0.01))-20*log10(10**t))
