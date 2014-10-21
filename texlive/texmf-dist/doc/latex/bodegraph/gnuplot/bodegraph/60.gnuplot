set table "gnuplot/bodegraph/60.table"; set format "%.5f"
set samples 50; set parametric; plot [t=-1:4] log10(10**t),180/3.1415957*(atan((15**2-(10**t)**2)/(2*0.3*15*10**t))-3.1415957/2)--180/3.1415957*atan(0.01*10**t)
