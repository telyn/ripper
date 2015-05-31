TOOLS=istrayopen rip rip-dvd ripwrap striplog

all: $(TOOLS)

clean: 
	rm -f istrayopen

install: $(TOOLS)
	mkdir -p /opt/ripper
	cp $(TOOLS) /opt/ripper

istrayopen: istrayopen.c
	gcc -o $@ $<
