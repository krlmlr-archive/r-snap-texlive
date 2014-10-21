import graph;

usepackage("palatino");
usepackage("mathpazo");

size(7inches,3inches);
scale(true);

real f(real x) { return sin(x); }
pair F(real x) { return (x, f(x)); }

real g(real x) { return sin(2x); }
pair G(real x) { return (x, g(x)); }

real h(real x) { return sin(0.5x); }
pair H(real x) { return (x, h(x)); }

xaxis("$x$");
yaxis("$y$");

draw(graph(f,-10.,10,operator ..), red);
draw(graph(g,-10.,10,operator ..), blue);
draw(graph(h,-10.,10,operator ..), green);

