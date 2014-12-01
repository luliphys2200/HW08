GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O0 -g 
LFLAGS = -O0 -g
LIBS = -lgsl -lm

all: initial-velocity.png launch-angle.png initial-altitude.png

initial-velocity.png: initial-velocity.gpl resiv
	$(GRAPH) initial-velocity.gpl
	
launch-angle.png: launch-angle.gpl resla
	$(GRAPH) launch-angle.gpl
	
initial-altitude.png: initial-altitude.gpl resia
	$(GRAPH) initial-altitude.gpl
	
resiv: initial-velocity
	./initial-velocity > resiv

resla: launch-angle
	./launch-angle > resla

resia: initial-altitude
	./initial-altitude > resia

initial-velocity: initial-velocity.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)
	
launch-angle: launch-angle.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

initial-altitude: initial-altitude.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

clean : 
	rm -f *~
	rm -f *.o
	rm -f initial-velocity launch-angle initial-altitude

veryclean : clean
	rm -f resiv initial-velocity.png 
	rm -f resla launch-angle.png
	rm -f resia initial-altitude.png
	

