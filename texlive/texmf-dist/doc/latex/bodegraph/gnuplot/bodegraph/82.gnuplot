set table "gnuplot/bodegraph/82.table"; set format "%.5f"
set samples 81; set parametric; plot [t=-1:4] 10**((20*log10(abs(3/sqrt(1+(0.5*10**t)**2))))/20)*cos(3.1415957/180*(-180/3.1415957*atan(0.5*10**t))),10**((20*log10(abs(3/sqrt(1+(0.5*10**t)**2))))/20)*sin(3.1415957/180*(-180/3.1415957*atan(0.5*10**t)))
