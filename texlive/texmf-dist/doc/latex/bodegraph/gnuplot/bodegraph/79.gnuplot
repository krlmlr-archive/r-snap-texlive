set table "gnuplot/bodegraph/79.table"; set format "%.5f"
set samples 100; set parametric; plot [t=-1:1] -90+180/3.1415957*(atan((3**2-(10**t)**2)/(2*0.4*3*10**t))-3.1415957/2),20*log10(abs(0.3/(10**t)))+20*log10(abs(3.9/sqrt((1-(10**t/3)**2)**2+(2*0.4*(10**t/3))**2)))
