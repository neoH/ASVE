


all: libvpi.so
	run-cdns -f run.list -errormax 1 -uvmnoautocompile -L./ -loadvpi libvpi
clean:
	rm -rf *.log *.d *.history *.shm *.key

libvpi.so: my_vpi.cpp
	g++ -I/tools/cadence/installs/XCELIUM1803/tools.lnx86/include -I. my_vpi.cpp -fPIC -shared -o libvpi.so -fpermissive

##ar -rv libvpi.a vpihead.o
