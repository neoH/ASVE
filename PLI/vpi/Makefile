


all:
	run-cdns -f run.list -errormax 1 -uvmnoautocompile -L./ -loadvpi libvpi
clean:
	rm -rf *.log *.d *.history *.shm *.key

vpi: vpihead.cpp
	g++ -I/tools/cadence/installs/XCELIUM1803/tools.lnx86/include -I. vpihead.cpp -fPIC -shared -o libvpi.so -fpermissive

##ar -rv libvpi.a vpihead.o
