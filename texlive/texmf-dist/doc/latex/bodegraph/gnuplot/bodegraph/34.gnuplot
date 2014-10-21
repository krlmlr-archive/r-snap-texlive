set table "gnuplot/bodegraph/34.table"; set format "%.5f"
set samples 50; set parametric; plot [t=0:3] log10(10**t),20*log10(abs(1/(10**t)))+20*log10(2/0.08)-(t<log10(1/(0.08))?20*log10(1):+20*log10(1/(0.08))-20*log10(10**t))
