set table "gnuplot/bodegraph/95.table"; set format "%.5f"
set samples 31; plot [x=0:1.8] 1-.117*exp(-24.1*x)-.883*exp(-2.94*x)*cos(7.03*x)-.769*exp(-2.94*x)*sin(7.03*x)
