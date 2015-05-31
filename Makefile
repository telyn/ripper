TOOLS=istrayopen rip rip-dvd ripwrap striplog
VERSION=`git rev-parse HEAD`

all: $(TOOLS)

clean: 
	rm -f istrayopen ripper.deb

# I have no idea what the --requires should be on other systems so I choose to ignore them; I only need this tool on debian machines because I am a weeny
deb: $(TOOLS)
	checkinstall  --install=no --pkgname=telyn-ripper --pkgversion="0.1-$(VERSION)"  --requires="bash,libdvdcss2,handbrake-cli,cdparanoia,abcde,lame,id3,id3v2,incron" 

install: $(TOOLS)
	mkdir -p /opt/ripper
	cp $(TOOLS) /opt/ripper
	echo "/dev/sr0 IN_ATTRIB /opt/ripper/ripwrap" > /etc/incron.d/ripper

istrayopen: istrayopen.c
	gcc -o $@ $<
