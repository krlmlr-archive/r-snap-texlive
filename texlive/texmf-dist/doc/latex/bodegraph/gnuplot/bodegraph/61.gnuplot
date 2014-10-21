set table "gnuplot/bodegraph/61.table"; set format "%.5f"
set samples 150; set parametric; plot [t=-2:1]  180/3.1415957*(atan((3**2-(10**t)**2)/(2*0.1*3*10**t))-3.1415957/2),20*log10(abs(1/sqrt((1-(10**t/3)**2)**2+(2*0.1*(10**t/3))**2))) 
