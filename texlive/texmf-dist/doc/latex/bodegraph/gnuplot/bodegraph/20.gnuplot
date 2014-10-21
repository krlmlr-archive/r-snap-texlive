set table "gnuplot/bodegraph/20.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-1:2] log10(10**t),180/3.1415957*(atan((10**2-(10**t)**2)/(2*0.3*10*10**t))-3.1415957/2)
